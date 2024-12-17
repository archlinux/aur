# Maintainer: Your Name <your.email@example.com>
pkgname=flippen-browser
pkgver=1.0
pkgrel=1
pkgdesc="A simple web browser built with PyQt5 and QtWebEngine"
arch=('x86_64')
url="https://github.com/SergeyDash/flippen-browser"
license=('GPL3')
depends=('python-pyqt5' 'python-qtwebengine')
makedepends=('git')
source=("git+https://github.com/SergeyDash/flippen-browser.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir"
}
