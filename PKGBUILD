# Author: archtux <antonio dot arias99999 at gmail dot com>
# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>

pkgname=python2-espeak
pkgver=0.5
pkgrel=4
pkgdesc="Python bindings for eSpeak."
arch=('any')
url="https://launchpad.net/python-espeak"
license=('GPL3')
depends=('espeak' 'python')
source=("http://launchpad.net/python-espeak/trunk/$pkgver/+download/python-espeak-${pkgver}.tar.gz")
md5sums=('28dd6d2eff6aca10e259e02a81834245')

package() {
    cd "$srcdir/python-espeak-$pkgver"
    python2 setup.py install --root "$pkgdir" --optimize=1
}
