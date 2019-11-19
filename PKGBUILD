#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-currencyconverter
pkgver=2017
pkgrel=6
pkgdesc='Module and command-line tool for currency conversion and rate retrieval.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-currencyconverter"
depends=(python-xdg python3 python3-memoizedb)
source=(
  https://xyne.archlinux.ca/projects/python3-currencyconverter/src/python3-currencyconverter-2017.tar.xz
  https://xyne.archlinux.ca/projects/python3-currencyconverter/src/python3-currencyconverter-2017.tar.xz.sig
)
sha512sums=(
  e79e921d174f6c7fba72c8a0c7f086e39dccb37a4b9eab760f62d1a0fd878d4960768169106a84153155f28c540afff776d66b688f16f696a9a594adb1abaa73
  cececd8b5476af4dc6128403423c98332b8e54a2114a8b60f38e9ad75dd0da2cf51bcba117ccd4f188ff9fd740b41e8b13381f6a90bf46a4c70e99f4b8fa9061
)
md5sums=(
  b70b7a48bec9087759a3054d2a99bd06
  474dab72791a890addbcda62b4d64c83
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 currency_converter "$pkgdir"/usr/bin/currency_converter
}


# vim: set ts=2 sw=2 et:
