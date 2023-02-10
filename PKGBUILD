# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.0.27
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://github.com/mintsuki/jinx"
license=("BSD")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mintsuki/jinx/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('7a616d055a0931eb94d0afc457c62a2ebc83a1aab48d3cf8e498a2ccd7cc05aed12659bdbb294a7373a80f98ab42e93ae9284e487449963aedc84396ad263fb6')
depends=('bash' 'libarchive' 'git' 'curl')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 jinx "${pkgdir}/usr/bin/jinx"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
