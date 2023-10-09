#! /usr/bin/env bash

# Copyright 2023 SECO Mind Srl
# SPDX-License-Identifier: Apache-2.0

set -exEuo pipefail

PROTOC_MAJOR='24'
# check only major version of protoc
version=$(protoc --version | cut -d ' ' -f 2 | cut -d '.' -f 1)

if [[ $version != "$PROTOC_MAJOR" ]]; then
    echo "incompatible protoc version $version, expected $PROTOC_MAJOR" >&2
    exit 1
fi

cargo run --manifest-path rust/Cargo.toml -p rust-codegen -- -w proto -o out
mv -v out/edgehog.device.forwarder.rs rust/edgehog-device-forwarder-proto/src/proto.rs
