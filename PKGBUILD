# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=tgio
pkgver=0.0.2
pkgrel=1
pkgdesc=" io shell commands over telegram (echo, read, etc)"
arch=('any')
url="https://github.com/juantascon/tgio"
license=("GPL3")
depends=('python' 'python-xdg' 'python-pytelegrambotapi')
source=("https://github.com/juantascon/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1dc6f54730198e3fd56184fb907f571b0a8b4a91793bf302c4ab596886a7fed3')

package() {
    cd $srcdir/$pkgname-$pkgver/
    python setup.py install --root $pkgdir
}
