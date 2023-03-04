# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.0.34
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://github.com/mintsuki/jinx"
license=("BSD")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mintsuki/jinx/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('2404f06a0b5b5f6e8a596760a4ff38e7d69be28b69ecccfeca28913b50b1bcc152688c75483cc63190c583e8528912d637080f861ad06ad46b960a640c15062e')
depends=('bash' 'findutils' 'libarchive' 'git' 'curl')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 jinx "${pkgdir}/usr/bin/jinx"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
