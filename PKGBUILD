#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.12.7
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.12.7.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.12.7.tar.xz.sig
)
sha512sums=(
  8b8220df168cb27544be4d28f09a78ec8ab37d5645cf35abf5c80b6c0279370f2b237af4dd76f4ba98bd27b48c712834a6e03dff25d2c4d561cf25135430b650
  cd3670260bfacbc046951ed695ea4e95536c382b43fd7206c0ab717f3e561e31cc9fd3ec9f8641f9db16f295648c79083a3d911d7e2f4bab70b041065f8f4216
)
md5sums=(
  30e3bdbc783d8b2fbbdeed952b0540e6
  24d3d4aca130809c7a013779d9bbb53a
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
