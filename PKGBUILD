#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2022
pkgrel=3
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.dev/projects/python3-threaded_servers/src/python3-threaded_servers-2022.tar.xz
  https://xyne.dev/projects/python3-threaded_servers/src/python3-threaded_servers-2022.tar.xz.sig
)
sha512sums=(
  9f7c13eb91a96adf6dbeccd25b145767348d76ca230857a79f46f2b26e1766691f34ccf06f99a5e00e579a0e0c32cd5688392a57dd6490652b2332d1dccb6707
  635ddeb6d0b5aa23442f89e88ca0984839c7f23835baec7887eb0c8566dd65965141b66c5fb73c9b4704a3d63158e225999428ce2d0a43835ec6f014473e23e9
)
md5sums=(
  b0f0d742a2331498efc797e475355e2a
  5a71871c372654a0e498fbd7f29fc283
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
