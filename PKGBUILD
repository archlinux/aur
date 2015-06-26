# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python2-pynliner
pkgver=0.5.2
pkgrel=1
pkgdesc="Python CSS-to-inline-styles conversion tool for HTML using BeautifulSoup and cssutils."
arch=(any)
url="http://pypi.python.org/pypi/pynliner"

# It's necessary to dig around for it a bit, but the license is found at
# the project's Github page: https://github.com/rennat/pynliner
license=(MIT)
depends=(python2 python2-beautifulsoup4 python2-cssutils)
makedepends=(python2-setuptools)
source=("https://pypi.python.org/packages/source/p/pynliner/pynliner-${pkgver}.tar.gz")
md5sums=(5a0b85aa5448c8f8d14fb58e5ab1c3c1)

package () {
    
    cd "${srcdir}/pynliner-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1

}
