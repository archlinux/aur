# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=precis_i18n
pkgname=python-precis-i18n
pkgver=0.4.1
pkgrel=1
pkgdesc="Internationalized Usernames and Passwords"
arch=('any')
url="https://github.com/byllyfish/precis_i18n"
license=('MIT')
depends=('python')
source=("https://pypi.python.org/packages/ec/32/7f2b4d88a2696f75d14ee7741d4b97e4d87aba01bda0026a5f8c008da7f4/$_realname-$pkgver.tar.gz")
md5sums=('2c94464d0891866d99fe9d5a468956a4')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
