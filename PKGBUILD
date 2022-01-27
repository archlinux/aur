#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2022
pkgrel=1
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
  1b1485f0fb1d7479475dd2838e331ba711becbc010dada137897a079620a8ee68fcbbd41366ecaf2241beb43635dbc005e44126c6e3ed12a256a9b057561fa35
)
md5sums=(
  b0f0d742a2331498efc797e475355e2a
  cb1676310df5c3e02b242d914c612077
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
