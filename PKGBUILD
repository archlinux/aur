#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-currencyconverter
pkgver=2014.11
pkgrel=1
pkgdesc='Module and command-line tool for currency conversion and rate retrieval.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-currencyconverter"
depends=(python3 python3-memoizedb python-xdg)
source=(
  http://xyne.archlinux.ca/projects/python3-currencyconverter/src/python3-currencyconverter-2014.11.tar.xz
  http://xyne.archlinux.ca/projects/python3-currencyconverter/src/python3-currencyconverter-2014.11.tar.xz.sig
)
sha512sums=(
  aca82b2cbd25cada82240af57bc89d8f1da4175f4b656785958e1fb5e76e484a1dbf160a8ecdc63b35b89c41f5f4f5afd56c18184df1d9ca785284f446fc5257
  6a1adb5ed8a8c02e2dab6f8fa829a78c4459e2f30b8608ccb297809ad3b77947261188d1a3f52b86ed2a6a72bd44e7ac20336d036f9af8b422c9cb7c77bf152e
)
md5sums=(
  e4e3e61b234a251f6dbd6d489c0a3b16
  da0bef4a1c93b7e5e2db787d77800b90
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 currency_converter "$pkgdir"/usr/bin/currency_converter
}


# vim: set ts=2 sw=2 et:
