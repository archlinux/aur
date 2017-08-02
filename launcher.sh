#!/bin/sh
#-----------------------------------------------------------------------------------------------------------------------
# This file is part of Fim - File Integrity Manager
#
# Copyright (C) 2017  Etienne Vrignaud
#
# Fim is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Fim is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Fim.  If not, see <https://www.gnu.org/licenses/>.
#-----------------------------------------------------------------------------------------------------------------------

if type tput > /dev/null 2>&1; then
    export TERMINAL_COLUMNS=$(tput cols)
fi

JAVA_OPTIONS="-Xmx2g -XX:MaxMetaspaceSize=128m"

java ${JAVA_OPTIONS} -jar "/usr/lib/fim/fim.jar" "$@"

#-----------------------------------------------------------------------------------------------------------------------
