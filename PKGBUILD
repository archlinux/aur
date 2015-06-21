#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=quickserve
pkgver=2013.5
pkgrel=1
pkgdesc='A simple HTTP server for quickly sharing files.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/quickserve"
depends=(python3-threaded_servers)
source=(
  http://xyne.archlinux.ca/projects/quickserve/src/quickserve-2013.5.tar.xz
  http://xyne.archlinux.ca/projects/quickserve/src/quickserve-2013.5.tar.xz.sig
)
sha512sums=(
  f11309fb3e5bd9b673af7c8aacb14185d182883522a73bc58b3ba3c6c9e5ac6fb82b0fa2cc43f381791ffe6604aabb330649c5a58ed36de92fc37e026a7e4a2e
  0713439ed546c97985ccf105d087f10f57e96f85766fe57a7d3ad94c518b411512741a28eb6d23f03a3ea64bd24a08814f5a565926739c265af7c66225a8a9f9
)
md5sums=(
  2a494fa7093bec80a23069855e36db5b
  fff3316cbf34780d5ce8eb7aea4407b3
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
