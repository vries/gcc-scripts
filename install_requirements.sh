#!/bin/sh -x

set -e

packages="g++ m4 flex libc6-dev-i386 texinfo autogen dejagnu gnat gawk"

for p in ${packages}; do
  sudo apt-get -y install ${p};
done
