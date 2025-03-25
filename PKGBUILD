# Author: archtux <antonio dot arias99999 at gmail dot com>
# Contributor: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
# Maintainer: Bink

pkgname=python-espeak
pkgver=0.5
pkgrel=6
pkgdesc="Python bindings for eSpeak."
arch=('any')
url="https://launchpad.net/python-espeak"
license=('GPL3')
depends=('espeak' 'python')
makedepends=('python-distutils-extra')
source=("http://launchpad.net/python-espeak/trunk/$pkgver/+download/python-espeak-${pkgver}.tar.gz")
md5sums=('28dd6d2eff6aca10e259e02a81834245')

package() {
    cd "$srcdir/python-espeak-$pkgver" || exit
    python setup.py install --root "$pkgdir"
}
