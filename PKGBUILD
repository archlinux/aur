# Maintainer: Yaron de Leeuw <jdlmail at gmail >

# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl
pkgname=python-pies
_pkgname=pies
pkgver=2.6.1
pkgrel=2
pkgdesc="The simplest (and tastiest) way to write one program that runs on both Python 2.6+ and Python 3."
arch=('any')
url="https://github.com/timothycrosley/pies"
license=('MIT')
depends=('python')
makedepends=(python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('65312c468735c1d7b18c722b2ecd47be')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

