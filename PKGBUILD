# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python2-geventhttpclient
pkgver=1.3.0
pkgrel=1
pkgdesc="An HTTP library for gevent."
arch=(i686 x86_64)
url="http://pypi.python.org/pypi/geventhttpclient"
license=(MIT)
depends=(python2 python2-certifi python2-backports.ssl_match_hostname)
makedepends=(python2-setuptools)
source=("https://pypi.python.org/packages/14/fb/7a70afa735e6ef381bb671a10b9127ab1550b1d1807a299e5d37aea710c5/geventhttpclient-1.3.0.tar.gz#md5=39ab1fcdd6b11021e21144fa46af6d26")
md5sums=(39ab1fcdd6b11021e21144fa46af6d26)

package () {
    cd "${srcdir}/geventhttpclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1

}
