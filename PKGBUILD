# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python2-gevent-socketio
pkgver=0.3.6
pkgrel=2
pkgdesc="SocketIO server based on the gevent pywsgi server, a Python network library."
arch=(any)
url="http://pypi.python.org/pypi/gevent-socketio"
license=(BSD)
depends=(python2 python2-gevent python2-gevent-websocket)
makedepends=(python2-setuptools)
source=("https://pypi.python.org/packages/source/g/gevent-socketio/gevent-socketio-${pkgver}.tar.gz")
md5sums=(33f745d74885366a07da516c000854b6)

package () {
    
    cd "${srcdir}/gevent-socketio-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1

    install -Dm0644 "${srcdir}/gevent-socketio-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
