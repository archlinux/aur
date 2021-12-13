# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-backoff'
_name=${pkgname#python-}
pkgver=1.11.1
pkgrel=2
pkgdesc="Function decoration for backoff and retry."
arch=('any')
url="https://github.com/litl/backoff"
license=('MIT')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('c497b9d25015283c612bae25c50ad67e7de92187d17d00db4e4913f9ffa887e71269ebb51b558a87c3d70f7cc2217f5dbe854299b48111f8129c014b1aa1cac1')

package() {
  cd backoff-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}
