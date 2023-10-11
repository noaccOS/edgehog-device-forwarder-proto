# Copyright 2023 SECO Mind Srl
# SPDX-License-Identifier: Apache-2.0

.PHONY=clean
.PHONY=all
.PHONY=rust

PROTO_DIR=proto
PROTO_FILES=$(wildcard $(PROTO_DIR)/edgehog/device/forwarder/*.proto)
export PROTO_DIR
export PROTO_FILES

# Rust
RUST_OUT_DIR=rust/edgehog-device-forwarder-proto/src
RUST_OUTPUT=$(RUST_OUT_DIR)/proto.rs

$(RUST_OUTPUT): $(PROTO_FILES)
	cargo run --manifest-path rust/Cargo.toml -p rust-codegen -- -w proto -o $(RUST_OUT_DIR)
	mv $(RUST_OUT_DIR)/edgehog.device.forwarder.rs $(RUST_OUTPUT)

rust: $(RUST_OUTPUT)

all: rust

clean:
	rm -vr out/
