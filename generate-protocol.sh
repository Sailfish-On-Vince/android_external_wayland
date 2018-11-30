#!/bin/sh
cd $1
wayland-scanner server-header < protocol/wayland.xml > protocol/wayland-server-protocol.h
wayland-scanner code < protocol/wayland.xml > protocol/wayland-protocol.c
wayland-scanner client-header < protocol/wayland.xml > protocol/wayland-client-protocol.h

cp src/wayland-version.h.in src/wayland-version.h

sed -i 's/@WAYLAND_VERSION_MAJOR@/1/' src/wayland-version.h
sed -i 's/@WAYLAND_VERSION_MINOR@/6/' src/wayland-version.h
sed -i 's/@WAYLAND_VERSION_MICRO@/1/' src/wayland-version.h
sed -i 's/@WAYLAND_VERSION@/"1.6.1"/' src/wayland-version.h

