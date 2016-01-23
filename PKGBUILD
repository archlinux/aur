# Maintainer: Dean Galvin <deangalvin3@gmail.com>

_pkgname="vincenty"
pkgname="python-vincenty"
pkgdesc="Calculate the geographical distance (in kilometers or miles) between 2 points with extreme accuracy."
pkgver=0.1.3
pkgrel=1
url="https://github.com/maurycyp/vincenty"
license=('Unlicense')
arch=('any')
makedepends=('python-setuptools')
depends=('python>=3.4')
conflicts=('python-vincenty')
source=("http://pypi.python.org/packages/source/v/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('199acac515ddebbd787548c8cd81fdb1d926dc0c58d04255810af7e79bcb3f6b')

package() {
  chmod +r -R ${srcdir}/${_pkgname}-${pkgver}
  cd ${srcdir}/${_pkgname}-${pkgver}

  python3 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
