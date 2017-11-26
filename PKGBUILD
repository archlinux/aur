# Maintainer: Dean Galvin <deangalvin3@gmail.com>

_pkgname="vincenty"
pkgname="python-vincenty"
pkgdesc="Calculate the geographical distance (in kilometers or miles) between 2 points with extreme accuracy."
pkgver=0.1.4
pkgrel=1
url="https://github.com/maurycyp/vincenty"
license=('Unlicense')
arch=('any')
makedepends=('python-setuptools')
depends=('python>=3.4')
conflicts=('python-vincenty')
source=("https://pypi.python.org/packages/source/v/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('eaa2f2de835f369cbd71c1a01ccd4e0d412da0f4aeef7c9692242b9ce182785a')

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python3 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
