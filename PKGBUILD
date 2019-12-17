# Maintainer: Davide Garberi <dade.garberi@gmail.com>
# Contributor: gstux <gstux@protonmail.com>
pkgname=aurpkg
pkgver=1.2.4
pkgrel=1
epoch=
pkgdesc="A simple shell script to build and install packages from AUR repositories"
arch=('i686' 'x86_64' 'x86')
url="https://github.com/DD3Boh/aurpkg"
license=('GPL 3.0')
groups=('')
depends=('curl' 'git')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')
noextract=()

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/aurpkg "${pkgdir}"/usr/bin/aurpkg
}
