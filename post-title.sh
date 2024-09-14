#!/bin/sh
grep title: "$1" | sed -e 's/title: //g'
