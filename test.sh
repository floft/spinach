#!/bin/bash

#
# A script to test some of spinach's functionality
#

source ./spinach

#Version comparison
versions=(
	"1.0a 1.0alpha"
	"1.0alpha 1.0b"
	"1.0b 1.0beta"
	"1.0beta 1.0p"
	"1.0p 1.0pre"
	"1.0pre 1.0rc"
	"1.0rc 1.0"
	"1 1.0"
	"1.0 1.1"
	"1.1 1.1.1"
	"1.1.1 1.2"
	"1.2 2.0"
	"2.0 3.0.0"
	"0.6.01 0.6.1"
	"0.6.0_rc7 0.6.1"
)
for num in ${!versions[@]}; do
	v1="$(cut -d' ' -f1<<<"${versions[$num]}")"
	v2="$(cut -d' ' -f2<<<"${versions[$num]}")"
	
	#my version
	if ! version_cmp "$v1-1" "$v2-1"; then
		echo "Warning: version_cmp -- $v2-1 should be newer than $v1-1"
	fi

	#pacman's version
	if [[ $(vercmp "$v1-1" "$v2-1") == 1 ]]; then
		echo "Warning: vercmp -- $v2-1 should be newer than $v1-1"
	fi
done
