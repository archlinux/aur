#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-currencyconverter
pkgver=2021
pkgrel=15
pkgdesc='Module and command-line tool for currency conversion and rate retrieval.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-currencyconverter"
depends=(python-pyxdg python3 python3-memoizedb)
makedepends=(python-setuptools)
source=(
  https://xyne.dev/projects/python3-currencyconverter/src/python3-currencyconverter-2021.tar.xz
  https://xyne.dev/projects/python3-currencyconverter/src/python3-currencyconverter-2021.tar.xz.sig
)
sha512sums=(
  bef5bc812d4ca35c549d364459f0b02b74a0ea487e46a8c0f6971cdc8cc75dcf3f16a5d459771ea5d5d210ef8481135affb156392153ec4da963050be2a61453
  8ff542a4d950bd720af8715070368ee223f629ee1734de07fe674bd4cd9659d4ee5ba2d5a6ff31b81f105adbef6351c11987a63bf81747596029048de60351b7
)
md5sums=(
  21fe16b66554a312bf2c68b73d177894
  1472062c83c1877b1c8fba6d90f8b6cc
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 currency_converter "$pkgdir"/usr/bin/currency_converter
}


# vim: set ts=2 sw=2 et:
