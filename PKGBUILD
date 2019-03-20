# Copyright 2015 Aleksey Filippov

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

pkgname=turtle
pkgver=1.3.1
pkgrel=1
pkgdesc="A C++ Mock_object library based on Boost with a focus on usability, simplicity and flexibility."
arch=('i686' 'x86_64')
url="http://turtle.sourceforge.net"
license=('Boost')
source=("https://github.com/mat007/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('96e747159952a002474fb8db8e7a6416dbd6f1ff741c065bd7eef25dbf1ed39e')

package() {
    install -dm755 $pkgdir/usr/include/turtle
    install -dm755 $pkgdir/usr/include/turtle/detail
    install -m644 $srcdir/include/turtle/*.hpp $pkgdir/usr/include/turtle
    install -m644 $srcdir/include/turtle/detail/* $pkgdir/usr/include/turtle/detail
}
