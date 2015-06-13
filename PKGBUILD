# Maintainer: Sébastien Leduc <sebastien@sleduc.fr>
# Contributor: Malkov Fyodor aka krox: iksut@yandex.ru

pkgname=python-keyboardleds
pkgver=0.3.3
pkgrel=1
pkgdesc="A library to interact with your keyboard's LEDs (scroll lock, caps lock, num lock)."
arch=('any')
url="http://jwilk.net/software/python-keyboardleds"
license=('MIT')
depends=('python')
source=("http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('7db3710e665269f07dc61a20cd5441e2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=2 sw=2 et:
