# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=xkeysnail
pkgver=0.4.0
pkgrel=1
pkgdesc="Yet another keyboard remapping tool for X environment."
arch=('any')
url="https://github.com/mooz/xkeysnail"
license=('GPL')
depends=('python'
         'python-xlib'
         'python-evdev'
         'python-inotify-simple'
         'python-appdirs')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/x/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('eed97123cc3181f47d2d0371a140e6eb780a7ed40c1b24b1ea95b38ebdb9d8f7')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
