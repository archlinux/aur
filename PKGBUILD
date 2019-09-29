# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=notementum
pkgver=0.1.0
pkgrel=3
pkgdesc="A native Markdown notebook app."
arch=(any)
url='https://github.com/IvanFon/notementum'
license=(GPL3)
depends=('gtk3' 'gtksourceview4' 'python' 'python-gobject' 'python-mistletoe' 'python-pygments' 'python-setuptools' 'webkit2gtk')

source=(https://github.com/IvanFon/notementum/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('e1e0fc06d26c6e4bb1487a521b9c6a8a1c0338a6d237cb431ff17bc434510ef5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
