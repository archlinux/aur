# Maintainer: meow <sosdjolfkhgsldjkfh@gmail.com>

pkgname=vice-standalone
pkgver=1.0
pkgrel=1
pkgdesc="Valve's tool for ICE encryption. Installs itself under /bin/vice. https://developer.valvesoftware.com/wiki/Using_Vice_without_Steam"
arch=('x86_64')
url="https://github.com/foobarhl/vice_standalone"
# license=('MIT')
source=("git+https://github.com/foobarhl/vice_standalone.git")
sha256sums=('SKIP')
conflicts=('vice')

build() {
  cd "${srcdir}/vice_standalone/src"
  pwd
  CXXFLAGS="" make
}

package() {
  install -Dm755 "${srcdir}/vice_standalone/bin/vice" "${pkgdir}/usr/bin/vice"
}
