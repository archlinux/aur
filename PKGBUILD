# Maintainer: Sergio de la Cruz <sergiodlc+arch@gmail.com>

pkgname=cmarked
pkgver=0.1.1
pkgrel=1
pkgdesc="A multi platform CommonMark (Markdown) editor"
arch=('any')
url="https://github.com/sergiodlc/cmarked"
license=('MIT')
depends=('python-pyside' 'cmark')
makedepends=('python-setuptools')
source=("cmarked::git+https://github.com/sergiodlc/cmarked.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/cmarked"
  python setup.py install --root="$pkgdir/" --optimize=1
}
