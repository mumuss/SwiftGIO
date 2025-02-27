#!/bin/sh
#
# Wrapper around `swift build' that uses pkg-config in config.sh
# to determine compiler and linker flags
#
. ./config.sh
[ -e Sources/${Module}.swift ] || ./generate-wrapper.sh
if [ -z "$@" ]; then
    JAZZY_ARGS="--theme fullwidth --author Ren&eacute;&nbsp;Hexel --author_url https://www.ict.griffith.edu.au/~rhexel/ --github_url https://github.com/rhx/Swift$MOD --github-file-prefix https://github.com/rhx/Swift$MOD/tree/generated --root-url http://rhx.github.io/Swift$MOD/ --output docs"
fi
./build.sh
rm -rf .docs.old
mv docs .docs.old 2>/dev/null
jazzy --swift-build-tool spm --clean --module-version $JAZZY_VER	\
      --module $MOD $JAZZY_ARGS "$@" -b $JAZZY_B
