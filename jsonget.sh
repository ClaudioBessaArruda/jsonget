#!/bin/sh
# Returns json value from first match key
#
# Made in 2023 by ClaudioBessaArruda
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

# jsonget.sh file key
if [ -f "$1" ]; then
        grep -Poi "((?:(\"($2)\":)(?:( *\")\K))[^\"]*)" $1 | head -n 1
        exit 0
# jsonget.sh key file
elif [ -f "$2" ]; then
        grep -Poi "((?:(\"($1)\":)(?:( *\")\K))[^\"]*)" $2 | head -n 1
        exit 0
else
        echo "ERROR - No file was found in parameters"
        exit 1
