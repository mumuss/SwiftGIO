#!/bin/sh
#
# Wrapper around `swift test' using config.sh and checking
# that the swift wrapper code exists
#
. ./config.sh
[ -e Sources/${MOD}/${Module}.swift ] || ./generate-wrapper.sh
exec swift test $CCFLAGS $LINKFLAGS "$@"
