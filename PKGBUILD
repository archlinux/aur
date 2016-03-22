# Maintainer: Ng Oon-Ee <n g  o o n  e e DOT t a l k AT gmail DOT com>
_python=python
_distname=docx
pkgname=$_python-$_distname
pkgver=0.8.5
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
md5sums=('31c20c1b4b565f4e8830fbcafefe1be9')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  $_python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 || exit 1
}
