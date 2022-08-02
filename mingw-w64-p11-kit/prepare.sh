#!/bin/bash -x

cd "$(dirname $0)"

rm -rf src
mkdir -p src
cd src

tar -xvf ../p11-kit-0.24.1.tar.xz
cp ../libtool.m4.new /usr/share/aclocal/libtool.m4
cp ../lib-ld.m4.new /usr/share/aclocal/lib-ld.m4
cp ../ltmain.sh.new /usr/share/libtool/build-aux/ltmain.sh

# mkdir -p p11-kit-0.24.1/build/m4 p11-kit-0.24.1/build/litter

cp p11-kit-0.24.1/build/m4/libtool.m4 ..
cp p11-kit-0.24.1/build/m4/lib-ld.m4 ..
cp p11-kit-0.24.1/build/litter/ltmain.sh ..

cp ../*.m4.new p11-kit-0.24.1/build/m4/
cp ../ltmain.sh.new p11-kit-0.24.1/build/litter/

PATCHFILE=../0016-spaces-in-path-names.patch

diff -u p11-kit-0.24.1/build/m4/lib-ld.m4 p11-kit-0.24.1/build/m4/lib-d.m4.new >$PATCHFILE
diff -u p11-kit-0.24.1/build/m4/libtool.m4 p11-kit-0.24.1/build/m4/libtool.m4.new >>$PATCHFILE
diff -u p11-kit-0.24.1/build/litter/ltmain.sh p11-kit-0.24.1/build/litter/ltmain.sh.new >>$PATCHFILE

sha256sum $PATCHFILE
echo Place SHA in PKGBUILD
