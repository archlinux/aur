# Maintainer: Sébastien Leduc <sebastien@sleduc.fr>
# Contributor: Malkov Fyodor aka krox: iksut@yandex.ru

pkgname=python-keyboardleds
pkgver=0.3.4
pkgrel=1
pkgdesc="A library to interact with your keyboard's LEDs (scroll lock, caps lock, num lock)."
arch=('any')
url="http://jwilk.net/software/python-keyboardleds"
license=('MIT')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ac416c2f383c212a8fc018a83c979bd0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=2 sw=2 et:
