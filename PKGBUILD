# Maintainer: Sean Enck <enckse@gmail.com>

pkgname=selfie-git
pkgver=2017.03.04.66ad6bc2eccde377231876c3d6a539fac57a0230
pkgrel=2
pkgdesc="An educational tiny self-compiling C compiler/self-executing MIPS emulator/self-hosting MIPS hypervisor"
arch=('any')
url="http://selfie.cs.uni-salzburg.at/"
license=('BSD')
depends=('gcc-multilib')
source=("git+https://github.com/cksystemsteaching/selfie")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/selfie
  make
}

package() {
  cd ${srcdir}/selfie
  install -Dm755 selfie "${pkgdir}/usr/bin/selfie"
}
