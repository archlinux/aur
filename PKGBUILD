#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=timedatectl-restorer
pkgver=2013.7.12
pkgrel=1
pkgdesc='Restore system time across reboots when the internal clock is dead.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/timedatectl-restorer"
depends=(python3)
optdepends=('systemd: service support')
source=(
  http://xyne.archlinux.ca/projects/timedatectl-restorer/src/timedatectl-restorer-2013.7.12.tar.xz
  http://xyne.archlinux.ca/projects/timedatectl-restorer/src/timedatectl-restorer-2013.7.12.tar.xz.sig
)
sha512sums=(
  12fa49609b53911b59eb0a800b251737f7cf4fe1863477b6d653e16b56583a66541b8448b031927172ab390f87e54e0bf1ccd8f4f59ca5ad7d9004d01a40db4d
  2b87d212c2e20b168ef6b8ef67d78eae28f1f57d64631c4d24c4a45626baa3aff88252cc48708a6c0372e43a786e616d3a23cf846860ce36a4bed95f9b48bb28
)
md5sums=(
  462cc447da995a4c259bffc794a7ad27
  d8533d6f498627635107d5a15782d1ef
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
}

# vim: set ts=2 sw=2 et:
