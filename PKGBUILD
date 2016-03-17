#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-currencyconverter
pkgver=2016.3
pkgrel=1
pkgdesc='Module and command-line tool for currency conversion and rate retrieval.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-currencyconverter"
depends=(python-xdg python3 python3-memoizedb)
source=(
  http://xyne.archlinux.ca/projects/python3-currencyconverter/src/python3-currencyconverter-2016.3.tar.xz
  http://xyne.archlinux.ca/projects/python3-currencyconverter/src/python3-currencyconverter-2016.3.tar.xz.sig
)
sha512sums=(
  f6ef72e33893296cc394cb1e623680af8ede7dfca1beea7d88386ed8439af75856c7bf5b29028d90fbd762b1b268dfacc9b325693981b2bfc85ec0599f4bdb78
  5706095e199f4ee3e9c94366d51db78634c9f58b83f4968912ed9a755d53621ac53ac530b22aa12d7f89f120c4300c6103f4df5e2aef426e0966015ae5c8557d
)
md5sums=(
  12715c82c03b4e294b28ba6c20c45ba5
  b14812edebde77fbb2666a584955c794
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 currency_converter "$pkgdir"/usr/bin/currency_converter
}


# vim: set ts=2 sw=2 et:
