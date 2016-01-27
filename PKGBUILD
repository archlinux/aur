#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.27
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.27.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.27.tar.xz.sig
)
sha512sums=(
  25c69f5f1de528c07a535cc0e686fd4d373e75ae7f0c3d6d7b0c83ed3b3dfc85265bef6ad2ea2ddf070a2031a9e3ab9b481620de807f5fbdd667ad258d425f3b
  468173cc0f721917e8360c4b929da32d4e10a45ddd8d64844265df17fad3c998276fb6780a41590cc0d4d7b08e116e5584d468872a54506e1e7f8d503cd7e9c7
)
md5sums=(
  fe4e2fc248f3411ba3d56254271831ea
  6407998f5dd8d3d8ffd6bc73b17934aa
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
