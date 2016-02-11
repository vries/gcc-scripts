#!/bin/sh -x

set -e

packages="g++ m4 flex libc6-dev-i386 texinfo autogen dejagnu gnat gawk libelf-dev"

for p in ${packages}; do
  sudo apt-get -y install ${p};
done

if gnat > /dev/null; then
    # To get gnat support
    v=$(gnat \
	| grep GNAT \
	| awk '{print $2}')
    vbase=$(echo "$v" \
	| sed 's%\([0-9]\.[0-9]*\).*%\1%')

    sudo apt-get -y install gcc-$vbase-multilib
fi


