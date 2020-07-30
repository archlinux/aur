# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-unit-convert
pkgver=1.0.0
pkgrel=1
pkgdesc='Easily convert units to different quantities'
arch=('any')
url="https://github.com/Peter92/unit-convert"
license=('MIT')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Peter92/unit-convert/archive/${pkgver}.tar.gz")
sha256sums=('937cc21ded0b3e6bcc32285334e77d9e8a23dc2d05846140cec05f018a9a98d4')

package() {
  cd "unit-convert-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}