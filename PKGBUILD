# Maintainer: Kim Scarborough <kim@scarborough.kim>

pkgname=python-anyascii
pkgver=0.3.1
pkgrel=1
pkgdesc="Transliterates almost all Unicode characters to ASCII"
arch=(any)
url='https://github.com/anyascii/anyascii'
license=('ISC')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/anyascii/anyascii/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5117308026e590811ab7300435b1a73a91d8f84cc0aa031d0eeaba80ec1886af')

package() {
  cd "${srcdir}/anyascii-${pkgver}/impl/python"
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
