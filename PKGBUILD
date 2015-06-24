pkgname=python2-elementtidy
pkgver=1.0
pkgrel=3
pkgdesc="The ElementTidy parser can read (almost) arbitrary HTML files, and turn them into well-formed element trees."
arch=('i686' 'x86_64')
license=('custom')
url="http://effbot.org/zone/element-tidylib.htm"
depends=('python2')
source=(http://effbot.org/media/downloads/elementtidy-1.0-20050212.zip)
makedepends=('setuptools')
md5sums=('b36db272e051156f9c66b8472c43bf64')

package() {
    cd $srcdir/elementtidy-1.0-20050212
    python2 setup.py install --root=$pkgdir
}
