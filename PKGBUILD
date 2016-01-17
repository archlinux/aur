#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.17
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.17.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.17.tar.xz.sig
)
sha512sums=(
  5e10c6320eaf32be0537df57d41d4ebfaa459f8c8b8394aef1fbea63c6cc39a4097fa88778f689b6d75e1b13d0bbe8c1cd4d70eb6b926c323880dd9d7c9d24d9
  e0d4e84403be9d68dd4408ad82a853b0980b2253827cb035708c05daeb075d73dfbd60879c671e0e35818d3927162f3d7be151910c3047407d62071ca7c82b9c
)
md5sums=(
  485a729529ca3c41d329af02e3cc13f2
  b97103e00c48bc8c416b7d7912693bf5
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
