#!/bin/bash

# =======================================================================================
# Docker image parameters
#
# Used in Docker image build scripts
# =======================================================================================

# - URL of the docker registry for push
export DOCKER_REGISTRY=ahuh

# - Name of the image to build
export IMAGE_NAME=nerdctl

# - Array of the tag versions to build for the image
declare -x -a TAG_VERSIONS=(
    v2.0.4
    v2.0
    v2
    latest
)

# - Map of the target (key) and tag suffix (value) for the image
# (remove map declaration for single build, without multi-stage build)
declare -x -A TAG_SUFFIXES=(
    [git]=git
)

# Docker file name to use for build
export DOCKERFILE_NAME=Dockerfile

# Docker tag separator to use between tag version and tag suffix
export TAG_SEPARATOR=-
