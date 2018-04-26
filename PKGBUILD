#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=quickserve
pkgver=2018
pkgrel=2
pkgdesc='A simple HTTP server for quickly sharing files.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/quickserve"
depends=(python3-threaded_servers)
optdepends=('avahi: Avahi support' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/quickserve/src/quickserve-2018.tar.xz
  https://xyne.archlinux.ca/projects/quickserve/src/quickserve-2018.tar.xz.sig
)
sha512sums=(
  8475377db2cca19509e5b34033f1c819b238c4bf984870e6abf1eeb63fadc4259f68d19fce23debb91c657a9efc3b531e9adf92858f7b4efd16bd2176b704448
  a9c57f18731fb3c266f454948d67d8b8b38bb3b245eafc0baed1f46c188f5964ad98999a5a5d59aadf7fea5c8a0d63dd0713903a3ffa0d126b80ba86d8bea725
)
md5sums=(
  83c69a4a434d1535a30592e2b72b8b9f
  69bd802380c015b992b2120c9b2ed430
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
