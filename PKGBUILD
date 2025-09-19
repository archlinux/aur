# Maintainer:  Dominik Kummer <admin at arkades.org>

pkgname=soprano-git
_pkgname=soprano
pkgver=v2.9.3.r95.g8d4fca7
pkgrel=1
pkgdesc="Soprano is a library which provides a highly usable object-oriented C++/Qt6 framework for RDF data."
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt6-base')
conflicts=('soprano')
provides=('soprano')
makedepends=('clucene' 'rasqal' 'raptor' 'redland' 'qt6-base')
source=("git+https://invent.kde.org/domson/soprano.git")
sha256sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B "$_pkgname/build" -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "$_pkgname/build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$_pkgname/build"
}
# Copyright (c) 2014-2025 Dominik Kummer <admin@arkades.org>, All Rights Reserved
#
# This file is part of Arkades (www.arkades.org).
#
# Arkades is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 2.1 of the License, or
# (at your option) any later version.
#
# Arkades is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with Arkades If not, see <http://www.gnu.org/licenses/>.
#
#
source=("git+file:///home/domson/git/kde/soprano")
# Copyright (c) 2014-2025 Dominik Kummer <admin@arkades.org>, All Rights Reserved
#
# This file is part of Arkades (www.arkades.org).
#
# Arkades is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 2.1 of the License, or
# (at your option) any later version.
#
# Arkades is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with Arkades If not, see <http://www.gnu.org/licenses/>.
#
#
source=("git+file:///home/domson/git/kde/soprano")
