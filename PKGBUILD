# Maintainer: Moab Omena <>

pkgname=snowbower
pkgver=1.1
pkgrel=1
arch=(any)
source=(https://github.com/moabomena/Snowbower/releases/download/v$pkgver/snowbower.sh)
url="https://github.com/moabomena/Snowbower"
pkgdesc='A program script to clear package managers caches'
license=(GPL3)
sha256sums=('b0d82b621d5b462b60ac2bf5a47dc3ff06f6a02bbd8535ce37f94e552a31f24c')

package() {
  install -d "$srcdir/$pkgname-$pkgver"
  install -Dm755 snowbower.sh "${pkgdir}"/usr/bin/snowbower
  chmod +x "${pkgdir}"/usr/bin/snowbower
}
