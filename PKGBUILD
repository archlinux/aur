#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=quickserve
pkgver=2018
pkgrel=5
pkgdesc='A simple HTTP server for quickly sharing files.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/quickserve"
depends=(python3-threaded_servers)
optdepends=('avahi: Avahi support' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.dev/projects/quickserve/src/quickserve-2018.tar.xz
  https://xyne.dev/projects/quickserve/src/quickserve-2018.tar.xz.sig
)
sha512sums=(
  8475377db2cca19509e5b34033f1c819b238c4bf984870e6abf1eeb63fadc4259f68d19fce23debb91c657a9efc3b531e9adf92858f7b4efd16bd2176b704448
  bb575d2f0a7cbc0699d2aaffa68b6f7ae0cf695572519cee925e3df97c878385cd027bbae4055d2e914cad53d805b507a6cfeb4d92c550fa14a9455c0b0f8a0b
)
md5sums=(
  83c69a4a434d1535a30592e2b72b8b9f
  594fbd01750509585178b9bc020ad683
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
