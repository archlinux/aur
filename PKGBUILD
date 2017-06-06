#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2017.6.6
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2017.6.6.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2017.6.6.tar.xz.sig
)
sha512sums=(
  16a379c45f3d56c9cb629e4950fa815242d4e7e5d9265573f808aa7e3199628807d50e7f3e485909d5705f59d436632229580f091d706ea9f436a643a4e1ec42
  8c4d1a2060056d9a79b6c3ea75b71c32553a2f84ea678539c7f72e1560d1cf679961ebb2ae7f7b10e49510af7485a9659e2f6733f0d595393ab82be3d9a54a92
)
md5sums=(
  fc0e1c73f6eb61762a8f29336116a6a5
  7c719d139ce4515b8509733c5fc7b2fa
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
