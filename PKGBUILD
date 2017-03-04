# Maintainer: Sean Enck <enckse@gmail.com>

pkgname=selfie-git
pkgver=2017.03.04.66ad6bc2eccde377231876c3d6a539fac57a0230
pkgrel=1
pkgdesc="An educational software system of a tiny self-compiling C compiler, a tiny self-executing MIPS emulator, and a tiny self-hosting MIPS hypervisor"
arch=('any')
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
