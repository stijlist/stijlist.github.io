#!/bin/sh

echo "$1" | sed -e 's/posts/files/g' -e 's/files\/\([0-9]\{4\}\)-\([0-9]\{2\}\)-\([0-9]\{2\}\)-/\/\1\/\2\/\3\//' -e 's/\.md/\.html/g'
