# Maintainer: xpt <user.xpt@gmail.com>

_name=emoji
pkgname=python-$_name
pkgver=0.3.4
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji/"
depends=('python2' )
license=('New BSD')
arch=('any')
source=("https://github.com/carpedm20/emoji/archive/v$pkgver.tar.gz")
md5sums=('e8c0fc160bbebdc98a8ab0f865bc7f93')

build() {
    cd $srcdir/emoji-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/emoji-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
