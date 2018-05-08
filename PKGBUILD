# Maintainer: xpt <user.xpt@gmail.com>

_name=emoji
pkgname=python2-$_name
pkgver=0.3.9
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji/"
depends=('python2' )
license=('New BSD')
arch=('any')

source=("https://files.pythonhosted.org/packages/47/e7/cf76e0774b13459e61ffe16a042a35f42e292aeebba060b919c05b0854ab/$_name-$pkgver.tar.gz")
sha256sum=('001b92b9c8a157e1ca49187745fa450513bc8b31c87328dfd83d674b9d7dfa63')

build() {
    cd $srcdir/emoji-$pkgver
    python2.7 setup.py build
}

package() {
    cd $srcdir/emoji-$pkgver
    python2.7 setup.py install --root="$pkgdir" --optimize=1 
}
