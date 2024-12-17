# Maintainer: Your Name <your.email@example.com>
pkgname=flippen-browser
pkgver=1.0
pkgrel=1
pkgdesc="A simple web browser"
arch=('x86_64')
url="https://github.com/SergeyDash/flippen-browser"
license=('GPL3')
depends=('python-pyqt5')
makedepends=('git')
source=("git+https://github.com/SergeyDash/flippen-browser.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir"
}
