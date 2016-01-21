#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.21.2
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.21.2.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.21.2.tar.xz.sig
)
sha512sums=(
  53289038a934ba7acfd48f7d075b194106db81d009e650c982f9511fda693d02a8bad98020657785538c48e8e7c16cb6b959f852a2f3679fd18afec9ff2a41cd
  6fe77cb0d7831bb770791a8a56df8d8483da8d040bf08aa3d803769423ffa61daf97f251ab99b8002fcca95dde964f930ddc28960362988767ed290efcd608ad
)
md5sums=(
  cb9fe05e2b52d372d1efb16c62f8e2ac
  ba37b2bec7e6cdd95e4fcdbb73ee6d09
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
