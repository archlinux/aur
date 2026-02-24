#!/bin/bash
: '
Copyright (C) 2016-2017 Korcan Karaokçu <korcankaraokcu@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
'

if [ "$(id -u)" = "0" ]; then
	echo "Please do not run this script as root!"
	exit 1
fi

# Preserve env vars to keep settings like theme preferences.
# Pkexec does not support passing all of env via a flag like `-E` so we need to
# rebuild the env and then pass it through.
ENV=()
while IFS= read -r line
do
    ENV+=("$line")
done < <(printenv)

pkexec env "${ENV[@]}" /usr/lib/pince/PINCE.py