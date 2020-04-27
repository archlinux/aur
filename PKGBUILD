# Maintainer: Raymond W. Ko <r   a y     m  o nd DOT  w DOT k  o AT g  m ai l DOT COM>
_python=python
_distname=docx
pkgname=$_python-$_distname
pkgver=0.8.10
pkgrel=1
pkgdesc="A Python library for creating and updating Microsoft Word (.docx) files"
arch=(any)
url="https://github.com/python-openxml/python-docx"
license=('MIT')
depends=('python>=3.4' 'python-lxml>=3.1.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/python-openxml/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('cf6af380f2cc049264e13ae35e8ffa4e')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  $_python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 || exit 1
}
