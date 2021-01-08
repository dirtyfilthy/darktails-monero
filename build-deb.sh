#!/bin/sh
export PKGNAME=darktails-monero-gui
SCRIPT="$0"
SCRIPTPATH=$(cd $(dirname "$SCRIPT") && pwd)
(	
	DISTDIR=$SCRIPTPATH/dist/deb
        SKELDIR=$DISTDIR/skel
        BUILDDIR=$DISTDIR/build
	FULLBUILD=$BUILDDIR/$PKGNAME
	rm -rf $FULLBUILD
        mkdir -p $FULLBUILD
	mkdir -p $FULLBUILD/usr/local/bin/
	cp -r $SKELDIR/* $FULLBUILD
        cp -r $SCRIPTPATH/build/release/bin/* $FULLBUILD/usr/local/bin/
        rm $FULLBUILD/usr/bin/.keep
	cd $BUILDDIR
	fakeroot dpkg --build darktails-monero-gui
)

