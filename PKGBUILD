#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.20.1
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.20.1.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.20.1.tar.xz.sig
)
sha512sums=(
  8e429ce311ec74352df70a05b39e499db3331a8011a8dae0b565d0eba98d6a15f20db8a0eb0045ffcb8cbeef4c3aa43bc88a43aa7d79ee33f513678480a89373
  c62ecaffbc4157fb72c2629b63ff67ef4125f8026d16698b1425dca03735c2e0010123034ced95c7a7feea39c0ebc72a3edaa7af8f4372d6e62c2c26d588c7d9
)
md5sums=(
  8fda33ffb7d844e470737637ab0de18f
  9e3cc60743a3c8dd3b4fc9e09cd8d099
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
