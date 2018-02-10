# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=xkeysnail
pkgver=0.1.0
pkgrel=1
pkgdesc="Yet another keyboard remapping tool for X environment."
arch=('any')
url="https://github.com/mooz/xkeysnail"
license=('GPL')
depends=('python'
         'python-xlib'
         'python-evdev')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/x/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4f20afcbebd533ca691f1c3672db6f27caa9a336556abc2a5799676851942062')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
