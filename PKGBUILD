#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2017.1
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2017.1.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2017.1.tar.xz.sig
)
sha512sums=(
  efb778de3cf7e67d1dd51e34ccd179d69aaba6d45c19e01725fdb6746759b94557adedebc9b99034ec5ebef0fc176e9cf2aed7d9f5d8a52664e177a06a57acb2
  20bce4b25b651ce2bac0456e8d05c2ffbea8cfe70bc866c85aadc6406664ab077dc53e4921f7542932263c2a034e4394cef5bd74cc8c2f38c808385248e3ddb8
)
md5sums=(
  630ee580265a30699826c1597b8b5dc8
  ef079edad1bdce18cd91e36373fd1873
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
