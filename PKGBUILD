#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-currencyconverter
pkgver=2016.4
pkgrel=1
pkgdesc='Module and command-line tool for currency conversion and rate retrieval.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-currencyconverter"
depends=(python-xdg python3 python3-memoizedb)
source=(
  http://xyne.archlinux.ca/projects/python3-currencyconverter/src/python3-currencyconverter-2016.4.tar.xz
  http://xyne.archlinux.ca/projects/python3-currencyconverter/src/python3-currencyconverter-2016.4.tar.xz.sig
)
sha512sums=(
  d2a119b77dda2b9719129356da6fda0497940c6d2ae143e5317fa492226eeea07ac5161d3601f7b6f0bf1830bc719c9a8d2ec4d3ec2b06b221cd9253eabf7e80
  90864f5a426e527d00c01ccf4c895c5967365c20ddd18ae05cac5ea75dd9b808a9c99261671b3bc6e7b84fdd21c36e5811023f25816c1d5116ff46cb78052d68
)
md5sums=(
  f456143db5fd8520f7c34dd1b59c099e
  974efe5c67e43c4f2b1101ec03ab0841
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 currency_converter "$pkgdir"/usr/bin/currency_converter
}


# vim: set ts=2 sw=2 et:
