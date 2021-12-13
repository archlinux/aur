#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-currencyconverter
pkgver=2021
pkgrel=2
pkgdesc='Module and command-line tool for currency conversion and rate retrieval.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-currencyconverter"
depends=(python-pyxdg python3 python3-memoizedb)
source=(
  https://xyne.dev/projects/python3-currencyconverter/src/python3-currencyconverter-2021.tar.xz
  https://xyne.dev/projects/python3-currencyconverter/src/python3-currencyconverter-2021.tar.xz.sig
)
sha512sums=(
  bef5bc812d4ca35c549d364459f0b02b74a0ea487e46a8c0f6971cdc8cc75dcf3f16a5d459771ea5d5d210ef8481135affb156392153ec4da963050be2a61453
  9c3691f6596db4d08e510d9f1ebd4324cf411627dfdd9723d8a5ceb30c1fcd977b381e4392c5aa32f8d5449d0dcdc425afab7acbc5aa64688b375898f8ffb6a3
)
md5sums=(
  21fe16b66554a312bf2c68b73d177894
  e7cc0351df05e49267fdc77813e5be30
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 currency_converter "$pkgdir"/usr/bin/currency_converter
}


# vim: set ts=2 sw=2 et:
