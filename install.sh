#!/bin/sh -e

# locate where Transmission.app is
transmission=`mdfind -name Transmission.app | head -n 1`
if ! [ -d "$transmission" ]; then
    echo Transmission.app: not found >&2
    exit 1
fi

cd web
webdir="$transmission/Contents/Resources/web"
echo Installing into $webdir
rsync -vacR --delete \
    *.html images/graphics/bookmarklet javascript/bookmarklet \
    "$webdir"/
