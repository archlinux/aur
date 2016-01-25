#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.25.2
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.25.2.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.25.2.tar.xz.sig
)
sha512sums=(
  cf4df1a8cf7ebea30c2c2921a123ed3a8ae6f1e893ad54930fa915f205be8db569633deb85ca8d38f779bc51545ecdbbe19e4af73eec988ad1353b2fa5f0a2a6
  07de3950de51473244852b9ecae43f1fea57876ddd6666caac8ce71d9c9c0dd530df176084050b20f8cbb8fa5cd2e5498e853948f4030c0ea00cc014b126cc49
)
md5sums=(
  9863023ccff719fc4fb8c7a588f1c0b6
  e3cf7bfea4600e94eac3518ad4521ccd
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
