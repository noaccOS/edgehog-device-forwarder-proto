#!/bin/sh

# Copyright 2023 SECO Mind Srl
# SPDX-License-Identifier: Apache-2.0

set -exu

REQUIRED_PROTOC_MAJOR="24"

# check only major version of protoc
PROTOC_MAJOR=$(command -v protoc >/dev/null &&
    protoc --version | cut -d ' ' -f 2 | cut -d . -f 1 ||
    true)

if [ "$PROTOC_MAJOR" != "$REQUIRED_PROTOC_MAJOR" ]; then
    echo "incompatible protoc version: found \"$PROTOC_MAJOR\", expected \"$PROTOC_MAJOR\"" >&2
    exit 1
fi
