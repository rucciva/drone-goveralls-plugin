#!/bin/sh

set -e

GOPATH=${PLUGIN_GOPATH:-"/go"} \
COVERALLS_TOKEN=${PLUGIN_TOKEN:-$COVERALLS_TOKEN} \
GIT_BRANCH=$DRONE_COMMIT_BRANCH \
goveralls \
    -coverprofile="${PLUGIN_COVERAGE_FILE:-"coverage.out"}" \
    -endpoint="${PLUGIN_ENDPOINT:-$COVERALLS_ENDPOINT}" 