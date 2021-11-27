# Maintainer: Liziqian <liziqian99@gmail.com>
# Contributor: Chi_Tang <bilibilichitang@hotmail.com>
# Contributor: KiteAB <kiteabpl@outlook.com>
pkgname=fuckmemory
pkgver=1.1.0
pkgrel=1
pkgdesc="A great program to fill up your memory or swap."
arch=('any')
url="https://github.com/FuckComputer/FuckMemory"
license=('GPL3')
source=($pkgname::"git+https://github.com/FuckComputer/FuckMemory.git")
sha256sums=('SKIP')
build() {
  cd "$pkgname/"
  make
}

package() {
  cd "$pkgname/"
  make
  mkdir -p "${pkgdir}/usr/bin"
  install -m=755 fuckmemory "${pkgdir}/usr/bin"
}
