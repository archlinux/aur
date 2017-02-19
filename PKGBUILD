# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python2-geventhttpclient
pkgver=1.3.1
pkgrel=1
pkgdesc="An HTTP library for gevent."
arch=(i686 x86_64)
url="http://pypi.python.org/pypi/geventhttpclient"
license=(MIT)
depends=(python2 python2-certifi python2-backports.ssl_match_hostname)
makedepends=(python2-setuptools)
source=('https://pypi.python.org/packages/35/41/33b552d780c1fef6427cbb314a69e8303a59e51b6aac25e07ded46aef6fa/geventhttpclient-1.3.1.tar.gz#md5=9aaac96fa4856ac919869a261c8b3dcb')
md5sums=('9aaac96fa4856ac919869a261c8b3dcb')

package () {
    cd "${srcdir}/geventhttpclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1

}
