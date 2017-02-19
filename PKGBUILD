# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python2-pynliner
pkgver=0.8.0
pkgrel=1
pkgdesc="Python CSS-to-inline-styles conversion tool for HTML using BeautifulSoup and cssutils."
arch=(any)
url="http://pypi.python.org/pypi/pynliner"

# It's necessary to dig around for it a bit, but the license is found at
# the project's Github page: https://github.com/rennat/pynliner
license=(MIT)
depends=(python2 python2-beautifulsoup4 python2-cssutils)
makedepends=(python2-setuptools)
source=("https://pypi.python.org/packages/f1/06/9b7fee106d273f663f452435864b14416af923254a7a8a33469e98140810/pynliner-${pkgver}.tar.gz#md5=b276fa4fd3999c362bf65cfb76fa1ed1")
md5sums=('b276fa4fd3999c362bf65cfb76fa1ed1')

package () {
    cd "${srcdir}/pynliner-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1

}
