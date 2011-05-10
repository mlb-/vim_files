#!/bin/sh
for bundle in `ls bundle`
do
	echo "Updating $bundle:"
	cd bundle/$bundle
	git fetch
	git checkout master
	git pull
	cd ../../
done
