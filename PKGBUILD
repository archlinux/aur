#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.14
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.14.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.14.tar.xz.sig
)
sha512sums=(
  ce2a2f89bc8cdc15292cb4d0aa58e4ede0a387c48346863ce89e580812052cdf24717c88cf805475655a89afbf31159e14e23c9905300885a9079d7ab70b673c
  a0fbe2a95931ed1e83a0ed374f5800bcc30791900a4bb42f63158829af23011a2840e2623c5cb0748cbd7e8f5a767d17412ec82111cac3e7f75d602bbfa11a44
)
md5sums=(
  41c66dd920a1bc968f2d9e68349f638d
  bf4c817602205c1ae8a832d8dcfab069
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
