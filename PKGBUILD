# Maintainer: xpt <user.xpt@gmail.com>

_name=emoji
pkgname=python2-$_name
pkgver=0.5.1
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji/"
depends=('python2' )
license=('New BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/41/5a/5b2cbaf1f8936e54a3756c4f0587cbe0615cd50c6b31340214ea61f92782/$_name-$pkgver.tar.gz")
sha256sums=('a9e9c08be9907c0042212c86dfbea0f61f78e9897d4df41a1d6307017763ad3e')

build() {
    cd $srcdir/emoji-$pkgver
    python2.7 setup.py build
}

package() {
    cd $srcdir/emoji-$pkgver
    python2.7 setup.py install --root="$pkgdir" --optimize=1 
}
