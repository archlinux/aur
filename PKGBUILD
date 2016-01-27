# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=tgio
pkgver=0.0.1
pkgrel=1
pkgdesc=" io shell commands over telegram (echo, read, etc)"
arch=('any')
url="https://github.com/juantascon/tgio"
license="GPL3"
depends=('python' 'python-xdg' 'python-pytelegrambotapi')
source=("https://github.com/juantascon/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7ac507b41d43ed6a24c5d0b62b8aa5a5ad631ae107c115a8d8996652ed2f6e7f')

package() {
    cd $srcdir/$pkgname-$pkgver/
    python setup.py install --root $pkgdir
}
