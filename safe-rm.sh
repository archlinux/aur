# Copyright © 2018 Francois Marier <francois@debian.org>
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
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Prepend "$1" to $PATH when not already in.
#  derived from Arch /etc/profile append_path()
prepend_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="$1${PATH:+:$PATH}"
    esac
}

# Ensure that safe-rm takes precedence over the real `rm` command
prepend_path '/usr/lib/safe-rm'
export PATH

# Remove our path function
unset -f prepend_path
