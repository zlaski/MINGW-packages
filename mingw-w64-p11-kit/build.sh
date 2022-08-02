#!/bin/bash -x

cd "$(dirname $0)"

rm -rf pkg src mingw*
MINGW_ARCH=mingw64 makepkg-mingw -sdiLf --skippgpcheck --skipinteg  2>&1 | tee $TEMP/build.log