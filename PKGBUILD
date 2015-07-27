# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>
# Contributor: Jeffery MacEachern <j.maceachern@gmail.com>

pkgname=aarddict
pkgver=0.9.3
pkgrel=1
pkgdesc="Aard Dictionary is a multiplatform dictionary and offline Wikipedia reader compatible with FBReader and CoolReader."
arch=(any)
url="http://aarddict.org/"
license=(GPL3)
depends=("python2" "python2-pyicu" "python2-simplejson" "hicolor-icon-theme" "python2-setuptools" "python2-pyqt")
makedepends=()
install=aarddict.install
source=(https://github.com/aarddict/desktop/archive/${pkgver}.tar.gz
        aarddict.install)
md5sums=('8f5bf2bdb50d0dcb70042337f6a7eb79'
         '4d14628e16252af7ddf562ad19e3bcb4')

package() {
    cd "$srcdir/desktop-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
