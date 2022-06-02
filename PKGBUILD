# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.0.1
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("x86_64")
url="https://github.com/mintsuki/jinx"
license=("BSD")
source=("https://raw.githubusercontent.com/mintsuki/jinx/v${pkgver}/jinx")
sha256sums=('SKIP')
depends=('docker')

package() {
  install -Dm755 "${srcdir}/jinx" "${pkgdir}/usr/bin/jinx"
}
