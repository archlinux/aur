# Maintainer: niwanowa  <nwianowa@gmail.com>
pkgname=leap_mouse
pkgver=0.1
pkgrel=1
pkgdesc="Mouse operation by Leap Motion"
arch=('any')
url='https://github.com/niwanowa/leap_mouse'
license=('custom:MIT')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
options=()
source=('git+https://github.com/niwanowa/leap_mouse.git')
md5sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    sudo python2 setup.py install
}
