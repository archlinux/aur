# Maintainer: Ivan Pacheco (Kinokoio) <kinokoio@hotmail.com>

pkgname=sbrowser-git
pkgver=9b861d4
pkgrel=1
pkgdesc="Simple browser based on PyQt5 and QtWebKit"
arch=(any)
url="https://github.com/kinokoio/sbrowser"
license=('GPL')
depends=('python' 'python-pyqt5' 'qt5-base'
         'qt5-webkit' 'python-setuptools')
makedepends=('coreutils' 'git')
source=("git+https://github.com/kinokoio/sbrowser")
sha256sums=("SKIP")

package() {
    cd "$srcdir/sbrowser"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm755 LICENSE $pkgdir/usr/share/doc/sbrowser/LICENSE
    install -Dm755 README.md $pkgdir/usr/share/doc/sbrowser/README
}
