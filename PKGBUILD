#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=timedatectl-restorer
pkgver=2013.7.12
pkgrel=4
pkgdesc='Restore system time across reboots when the internal clock is dead.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/timedatectl-restorer"
depends=(python3)
optdepends=('systemd: service support')
source=(
  https://xyne.dev/projects/timedatectl-restorer/src/timedatectl-restorer-2013.7.12.tar.xz
  https://xyne.dev/projects/timedatectl-restorer/src/timedatectl-restorer-2013.7.12.tar.xz.sig
)
sha512sums=(
  12fa49609b53911b59eb0a800b251737f7cf4fe1863477b6d653e16b56583a66541b8448b031927172ab390f87e54e0bf1ccd8f4f59ca5ad7d9004d01a40db4d
  d0f3c5160ed271214b8a813d173dba79fa48732bb6840af242cd7622d596d6aa3830172703fa25c4eb1b5de614906f8afce10b31ed9e95154f2c63fe9ae478c7
)
md5sums=(
  462cc447da995a4c259bffc794a7ad27
  203619c05e7d159436bbd5b659e9fc7b
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
}

# vim: set ts=2 sw=2 et:
