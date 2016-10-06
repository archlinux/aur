# Maintainer: Raymond W. Ko <r   a y     m  o nd DOT  w DOT k  o AT g  m ai l DOT COM>
_python=python
_distname=docx
pkgname=$_python-$_distname
pkgver=0.8.6
pkgrel=1
pkgdesc="A Python library for creating and updating Microsoft Word (.docx) files"
arch=(any)
url="https://github.com/python-openxml/python-docx"
license=('MIT')
depends=('python>=3.3' 'python-lxml>=2.3.2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/python-openxml/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('7f6e23ef0e391ea18ded1caa734db263')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  $_python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 || exit 1
}
