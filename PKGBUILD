# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.1.4
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://github.com/mintsuki/jinx"
license=("BSD")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mintsuki/jinx/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('62bf7f36164d65e2d8d2fb563e275c5c4674a2eadd541275a6138a88a93c2139a3eb226f4d74527ea5b17febbd8a66d982bde8e7a588e039f4313a5dacc2d125')
depends=('bash' 'findutils' 'libarchive' 'git' 'curl')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 jinx "${pkgdir}/usr/bin/jinx"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
