#!/bin/sh
# Returns json value from first match key
#
# Made in 2023 by Claudio Bessa
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

if [ -f "$1" -a -f "$2" ]; then
	echo "ERROR - Both parameters are files"
	exit 1
# jsonget.sh file key
elif [ -f "$1" ]; then
        # "key":"value"
	grep -Poi "((?:(\"($2)\" *:)(?:( *\")\K))[^\"]*)" $1 | head -n 1
	if [ -z $_ ]; then
                # "key":123456
		grep -Poi "(?:(\"($2)\" *:)(?:( *)\K))[0-9]+" $1 | head -n 1
		exit 0
	fi
	exit 0
# jsonget.sh key file
elif [ -f "$2" ]; then
	grep -Poi "((?:(\"($1)\" *:)(?:( *\")\K))[^\"]*)" $2 | head -n 1
	if [ -z $_ ]; then
		grep -Poi "(?:(\"($1)\" *:)(?:( *)\K))[0-9]+" $2 | head -n 1
		exit 0
	fi
	exit 0
else
	echo "ERROR - No file was found in parameters"
	exit 1
fi
