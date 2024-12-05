#!/bin/bash
# Build in RAM if your /tmp/ is mounted as tmpfs (cool!).

mkdir -p /tmp/principia_android_deps/
mkdir -p /tmp/principia_android_deps/{build,src}/
ln -sf /tmp/principia_android_deps/build build
ln -sf /tmp/principia_android_deps/src src
