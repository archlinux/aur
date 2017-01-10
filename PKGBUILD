#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2017
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2017.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2017.tar.xz.sig
)
sha512sums=(
  f9db5021b39716ae1b9262472736923202d588ad7c079c5611a460f44dbc6e859d652a69d661b7477a7cbd1520c0eb9c12cc7620a899a532d71192bb9954ed77
  d16b676d888bb9629b88cdd4069132cb1014b9b37a27c5abb3ee983948c1dbea45096ce5f691928d797c85da58be6f66c26901984e46d135c21d1476968095f6
)
md5sums=(
  231dfba58ff525053bf48b61dda91d4f
  b43546e9f712f6c9e44f100d19b7e361
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
