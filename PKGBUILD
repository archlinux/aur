# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python2-geventhttpclient
pkgver=1.1.0
pkgrel=3
pkgdesc="An HTTP library for gevent."
arch=(i686 x86_64)
url="http://pypi.python.org/pypi/geventhttpclient"
license=(MIT)
depends=(python2 python2-certifi python2-backports.ssl_match_hostname)
makedepends=(python2-setuptools)
source=("https://pypi.python.org/packages/source/g/geventhttpclient/geventhttpclient-${pkgver}.tar.gz")
md5sums=(877edc02ea60e4575927a80e4135e2bd)

package () {
    
    cd "${srcdir}/geventhttpclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1

}
