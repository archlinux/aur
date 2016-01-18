#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.18.1
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.18.1.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.18.1.tar.xz.sig
)
sha512sums=(
  36c712c024a2b190be6bdde60e767fadb97916a11e4b2919159782b70cfbf6360464ae1c3237e57f20b3fe04b46195089ee0f518141301bde3fcc6a9bd94d287
  3be11f7749fb187f1d169b5cef01b4fde61314ba4875b679dc9cd81f33bf8a93699c6070b2eef11f24893f5ce948cf971b9b8d435658c82b8ea6587d680f9490
)
md5sums=(
  afa37d2465ae2d7bcb0cb90d49cc8a33
  24d2d251a6f55be614f8181f5a5a4232
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
