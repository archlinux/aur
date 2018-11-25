#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2018.11
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  https://xyne.archlinux.ca/projects/mimeo/src/mimeo-2018.11.tar.xz
  https://xyne.archlinux.ca/projects/mimeo/src/mimeo-2018.11.tar.xz.sig
)
sha512sums=(
  94f1aecd35fdb3cb89c589a1f7f8eed73ba797f517f8f570c86d23de398c176dfe4fc4d79ec505cf7b6315ffce84352a7a56c6e97d2254c2f55f619322097d4f
  574e64ecb7cd72f38f69234b19042fe2e6d4bebaae7d88f8156a3be1ca9d166f4ca657e0e439e1b70a123bcafb6eeccf24fa7fef154eaa4b3a3aca1aded396b9
)
md5sums=(
  da56c93236eca558f1d3e2e700259d2c
  71f12dad0ba512285fe2f90124bf275b
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
