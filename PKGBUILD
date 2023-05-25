# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.1.1
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://github.com/mintsuki/jinx"
license=("BSD")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mintsuki/jinx/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('89c19f9c2d5644590c07d062c65c88c4e8fc7e0c3ce6fabee949f4e87a724493d9d049a53c68c040fbe951a31a590416e0130649df6e5647d76da3d04370f2a8')
depends=('bash' 'findutils' 'libarchive' 'git' 'curl')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 jinx "${pkgdir}/usr/bin/jinx"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
