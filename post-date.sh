#!/bin/sh

dateprefix=`echo $1 | grep -Eo '[[:digit:]]+-[[:digit:]]+-[[:digit:]]+'`
date -j -f "%F" $dateprefix +"%B %d, %Y"
