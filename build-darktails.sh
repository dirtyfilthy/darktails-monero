#!/bin/sh
export PKGNAME=darktails-monero-gui
SCRIPT="$0"
SCRIPTPATH=$(cd $(dirname "$SCRIPT") && pwd)
if ! [ -f "$SCRIPTPATH/.env.built" ]; then
	( 
	  cd $SCRIPTPATH;
	  docker build --tag monero:build-env-linux --build-arg THREADS=4 --file Dockerfile.linux . && touch $SCRIPTPATH/.env.built
        )
fi
(
  cd $SCRIPTPATH;
  docker run --rm -it -v "$SCRIPTPATH:/monero-gui" -w /monero-gui monero:build-env-linux sh -c 'make release-static -j4'
)
