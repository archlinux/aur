#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.18.2
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.18.2.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.18.2.tar.xz.sig
)
sha512sums=(
  e7caa3617790ad78f02486fbcc48871d8f6c2e493384ae30b074b6bad411957d87d510b77cf29b892a369e963c9f7fb148255e4ba136bd9a0cf16c2bc9e5e8d6
  f543396d7df8aaa8c4d121eaf0c680a54d57597b9df1b9bae6eefdfcc41e1012bc48324d82802f2472165c99ec4dabb98771c9ed4be14f3447ecfbde9a306e68
)
md5sums=(
  862d94c2737340c28b9dbc61aad150a9
  09d52684b940d10dc0e85a33486f4b60
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
