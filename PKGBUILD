# Maintainer: xpt <user.xpt@gmail.com>

_name=emoji
pkgname=python2-$_name
pkgver=1.6.1
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji/"
depends=('python2' )
license=('New BSD')
arch=('any')

source=(https://github.com/carpedm20/emoji/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('f4c9d1be4f2f9c84f292251c6952068095cdc81ec983374ead47d942680de799')

build() {
    cd $srcdir/emoji-$pkgver
    python2.7 setup.py build
}

package() {
    cd $srcdir/emoji-$pkgver
    python2.7 setup.py install --root="$pkgdir" --optimize=1
}
