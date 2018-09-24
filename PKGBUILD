# Copyright 2018 Google LLC

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Maintainer: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
pkgname=hotdoc
pkgver=0.8.101
pkgrel=2
epoch=
pkgdesc="HotDoc: the tastiest API documentation system"
arch=('any')
url="https://github.com/hotdoc/hotdoc"
license=('LGPL2')
groups=()
depends=(
    'python'
    'python-sqlalchemy'
    'python-yaml'
    'python-schema'
    'python-toposort'
    'python-lxml'
    'python-wheezy'
)
makedepends=('npm')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/${pkgname}/${pkgname}.git#tag=${pkgver}")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
