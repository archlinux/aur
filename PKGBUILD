#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.23
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.23.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.23.tar.xz.sig
)
sha512sums=(
  e58f43ac8e63f09ef9386f60f44fa96fbe6c5540d7d5e8b1af0ce05595ac609eca0ff7e033232f44f03fd9913d591646de0d61aabc09a80c5edeb161c1f38389
  20c06a2959c595e42e966e6d1e4b08f51ff99e4f120bfa739e2b9ecbebc31a2da22676dc4cc64f934b978243297b81d2f4f25ec53809e5938fde8e9b3f793add
)
md5sums=(
  8f546509f4ac4860bbfd016b76372325
  fe2dc68ff99d78d0a6c86c2da6a55a72
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
