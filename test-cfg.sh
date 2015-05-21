#!/bin/sh

if [ "$STY" = "" ]; then
    echo "Error: Command should be run in a screen session"
    exit 1
fi

pwd=$(pwd -P)

test_cfg=$pwd/test.cfg

if [ -f $test_cfg ]; then
    . $test_cfg
fi

case "$board_config" in
    m32_)
	# default: {-m32,}
	boards="--board unix/ --board unix/-m32"
	;;
    _)
	# minimal
	boards="--board unix/"
	;;
    fpicxm32_)
	# -fpic/{-m32,}
	boards="--board unix/-fpic --board unix/-fpic/-m32"
	;;
    fpic_xm32_)
	# {fpic,_} x {-m32,_}
	boards="--board unix/ --board unix/-m32 --board unix/-fpic --board unix/-fpic/-m32"
	;;
    *)
	echo "no such board_config: $board_config"
	exit 1
esac

exec \
    ./script/test-patch \
    $rtf \
    $builds \
    $ref \
    $boards \
    $base \
    $branch
