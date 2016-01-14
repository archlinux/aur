#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.14.3
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.14.3.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.14.3.tar.xz.sig
)
sha512sums=(
  5bdcf551a8e53855bec6de1be6ecbf1b6890ffaa8463fcf89f506d24271c5840735d792686eb396b9495f5d1e90a736a2b366807fcba0b98ad300ceda2c4fd7a
  94b75c98c79a99d9b42bac408b8ce4c56f80b8a910090531ef011accfd6a503ab13731a22475db03f4b79a16464c769d15d64f334a41dd4093c71bead6ff7660
)
md5sums=(
  d88d5cf433967646760bb57169cde96a
  996b6ad692e6041e8e5cc1be28ee1704
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
