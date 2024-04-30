# Maintainer HLFH <gaspard@dhautefeuille.eu>
pkgname=python311-pip
pkgver=24.0
pkgrel=1
pkgdesc="A tool for installing and managing Python packages (for Python 3.11)"
arch=('any')
url="https://pip.pypa.io/"
license=('MIT')
depends=('python311')

source=("https://bootstrap.pypa.io/get-pip.py")

package() {
    cd "$srcdir"
    python3.11 get-pip.py --root="$pkgdir/" --prefix=/usr --no-warn-script-location
}

b2sums=('SKIP')
