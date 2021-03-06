# Linting Docker Hub Images

[![Build Status](https://travis-ci.org/COzero/linting-docker-hub-images.svg?branch=master)](https://travis-ci.org/COzero/linting-docker-hub-images)

Docker containers to play host to all the various linting tools.

This repository houses a set of Dockerfiles and associated scripts and configs,
for the following linters:

- [![linter-coffeelint build status](https://img.shields.io/docker/build/cozero/linter-coffeelint.svg)](https://hub.docker.com/r/cozero/linter-coffeelint/)  [CoffeeLint](http://www.coffeelint.org)
- [![linter-eslint build status](https://img.shields.io/docker/build/cozero/linter-eslint.svg)](https://hub.docker.com/r/cozero/linter-eslint/)  [ESLint](https://eslint.org)
- [![linter-haml-lint build status](https://img.shields.io/docker/build/cozero/linter-haml-lint.svg)](https://hub.docker.com/r/cozero/linter-haml-lint/)  [HAML-Lint](https://github.com/brigade/haml-lint)
- [![linter-html-hint build status](https://img.shields.io/docker/build/cozero/linter-html-hint.svg)](https://hub.docker.com/r/cozero/linter-html-hint/)  [Html Hint](https://github.com/yaniswang/HTMLHint)
- [![linter-markdownlint build status](https://img.shields.io/docker/build/cozero/linter-markdownlint.svg)](https://hub.docker.com/r/cozero/linter-markdownlint/)  [markdownlint](https://github.com/DavidAnson/markdownlint)
- [![linter-proselint build status](https://img.shields.io/docker/build/cozero/linter-proselint.svg)](https://hub.docker.com/r/cozero/linter-proselint/)  [proselint](https://github.com/amperser/proselint/)
- [![linter-python2-pylint build status](https://img.shields.io/docker/build/cozero/linter-python2-pylint.svg)](https://hub.docker.com/r/cozero/linter-python2-pylint/)  [PyLint (python2)](https://www.pylint.org)
- [![linter-python3-pylint build status](https://img.shields.io/docker/build/cozero/linter-python3-pylint.svg)](https://hub.docker.com/r/cozero/linter-python3-pylint/)  [PyLint (python3)](https://www.pylint.org)
- [![linter-remark-lint build status](https://img.shields.io/docker/build/cozero/linter-remark-lint.svg)](https://hub.docker.com/r/cozero/linter-remark-lint/)  [remark-lint](https://github.com/remarkjs/remark-lint/)
- [![linter-rubocop build status](https://img.shields.io/docker/build/cozero/linter-rubocop.svg)](https://hub.docker.com/r/cozero/linter-rubocop/)  [RuboCop](http://batsov.com/rubocop/)
- [![linter-sass-lint build status](https://img.shields.io/docker/build/cozero/linter-sass-lint.svg)](https://hub.docker.com/r/cozero/linter-sass-lint/)  [Sass Lint](https://www.npmjs.com/package/sass-lint)
- [![linter-stylelint build status](https://img.shields.io/docker/build/cozero/linter-stylelint.svg)](https://hub.docker.com/r/cozero/linter-stylelint/)  [Stylelint](https://github.com/stylelint/stylelint)
- [![linter-yamllint build status](https://img.shields.io/docker/build/cozero/linter-yamllint.svg)](https://hub.docker.com/r/cozero/linter-yamllint/)  [yamllint](https://github.com/adrienverge/yamllint)

Each linter's Dockerfile is housed, along with some other resources (e.g. entry
point script, default config) in its own directory within this repository.
From these directories, Docker images are built and uploaded to Docker Hub.

## Requirements

To build the images, all you need is the
[Docker client](https://store.docker.com/search?type=edition&offering=community)
appropriate to your operating system.

To run the tests, you'll need Google's
[Container Structure Tests framework](https://github.com/GoogleCloudPlatform/container-structure-test),
which is available either as a binary executable (for Linux only) or as a
Docker image (for all platforms).

## Building the images

The process is the same for each of the linters. Using ESLint as an example:

```bash
cd eslint
docker build --rm -t cozero/linter-eslint .
```

## Running the linters

To run a linter on your project, you'll first need to
[build the linter image](#building-the-images) and then, from your project
root:

```bash
docker run -v `pwd`:/app cozero/linter-eslint
```

Note that all linters expect the project code to be linted to be available
at the path `/app` (as per command above).

### proselint

[proselint](https://github.com/amperser/proselint/) is a little more basic in
that it does not support globbed files. You'll need to do that yourself in your
file. For example:

```bash
docker run --rm -v $(pwd):/app cozero/linter-proselint README.md
docker run --rm -v $(pwd):/app cozero/linter-proselint CHANGELOG.md
```

### pylint

One caveat: because of the way Pylint works, both Pylint containers (i.e. for
Python 2 and for Python 3) need an extra argument to run the linter. The
difference is that Pylint requires either a module or package to be specified,
or a file or directory containing such.

For example, if your project's base package is called `foo` and there is an
`__init__.py` file in the subdirectory `foo` off the project root directory,
you would need to invoke the linter thus:

```bash
docker run -v `pwd`:/app cozero/linter-python3-pylint foo
```

## Testing the containers

Again, each linter can be tested in a similar way. You'll need to
[build the images](#building-the-images) before you can test them.

Once you've built the images, here are the steps, using ESLint as an
example:

### On Linux

If you are on Linux, first ensure that you have installed the Container
Structure Tests binary to a location on your $PATH. Then:

```bash
cd eslint
structure-test -test.v -image cozero/linter-eslint test-config.yaml
```

### Non Linux

If you are not running Linux, the command to run is a little more complicated,
as you have to use the Container Structure Tests container. As this is
Docker-in-Docker, you'll need to ensure that the container has access to your
Docker client so it can run the linter image. These commands work on a Mac
(note that this has not been tested on Windows, and Linux users should use the
[Linux instructions](#on-linux) above):

```bash
cd eslint
docker run -v `pwd`:/test/ -v /var/run/docker.sock:/var/run/docker.sock \
  gcr.io/gcp-runtimes/container-structure-test -test.v \
  -image cozero/linter-eslint /test/test-config.yaml
```

## Deployment

Once the images are built, they can be deployed to Docker Hub using the
Docker CLI's `docker push`
[command](https://ropenscilabs.github.io/r-docker-tutorial/04-Dockerhub.html).

## TODO

### Improve tests

Currently the tests only check two things: that the relevant linter is
available in each linter container, and that it is at the expected version.

Some sense of the actual usefulness of the linters might be a good thing to
test, too. Maybe the tests could also run the images against an example
app that should fail all the linters in certain ways. However, the
disadvantage of such an integration test is that we could end up testing
the linters themselves - a waste of time because each linter has its own
test suite. At least *some* indication of the utility of the images would
be useful, though.
