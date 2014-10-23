#!/usr/bin/env fish

set -l BUNDLES (git submodule status | awk '{print $2}')
set -l P (pwd | sed -e "s@~@$HOME@" )

for bundle in $BUNDLES
	cd $P/$bundle; git checkout master; git pull
	cd $P
end
