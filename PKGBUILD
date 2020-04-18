# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-questplus
pkgver=2019.4
pkgrel=1
pkgdesc='This is a simple implementation of the QUEST+ algorithm in Python'
arch=('any')
url="https://github.com/hoechenberger/questplus"
license=('GPL-3.0')
depends=('python' 'python-json-tricks' 'python-scipy' 'python-xarray')
makedepends=('python-setuptools')
source=("https://github.com/hoechenberger/questplus/archive/${pkgver}.tar.gz")
md5sums=('510213f181df17d1194159b66307f9de')

package() {
  cd "${srcdir}/questplus-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}