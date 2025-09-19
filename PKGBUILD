# Contributor: Dominik Kummer <devel at arkades.org>

pkgname=shared-desktop-ontologies-git
_pkgname=shared-desktop-ontologies
pkgver=r86.8fc794d
pkgrel=1
pkgdesc="Ontologies necessary for the Nepomuk semantic desktop"
arch=('any')
license=('GPL')
makedepends=("cmake")
conflicts=("$_pkgname")
source=("git+https://invent.kde.org/domson/shared-desktop-ontologies.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
#   git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' # not working without tags
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() { 
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
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
source=("${pkgname}::git+file:///home/domson/git/kde/shared-desktop-ontologies")
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
source=("git+file:///home/domson/git/kde/shared-desktop-ontologies")
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
source=("git+file:///home/domson/git/kde/shared-desktop-ontologies")
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
source=("git+file:///home/domson/git/kde/shared-desktop-ontologies")
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
source=("git+file:///home/domson/git/kde/shared-desktop-ontologies")
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
source=("git+file:///home/domson/git/kde/shared-desktop-ontologies")
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
source=("git+file:///home/domson/git/kde/shared-desktop-ontologies")
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
source=("git+file:///home/domson/git/kde/shared-desktop-ontologies")
