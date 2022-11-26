# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.0.20
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://github.com/mintsuki/jinx"
license=("BSD")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mintsuki/jinx/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d55cd63d60e82d8f980c56f58a8f556e718ff746bc594e128ab8f77fcb00d246b9919f7c68be110ee794f5989986198612e31fa76c9cb5f4eb7007015b70320c')
depends=('libarchive' 'git' 'mercurial' 'curl')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 jinx "${pkgdir}/usr/bin/jinx"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
