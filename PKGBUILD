# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python2-pynliner
pkgver=0.7.1
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
md5sums=(968bf2eee2331c1d52a23232c281d344)

package () {
    cd "${srcdir}/pynliner-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1

}
