#!/bin/sh

echo "$1" | sed 's/files\/\([0-9]\{4\}\)-\([0-9]\{2\}\)-\([0-9]\{2\}\)/\/\1\/\2\/\3/'
