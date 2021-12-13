#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2021.11.20
pkgrel=2
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.dev/projects/python3-threaded_servers/src/python3-threaded_servers-2021.11.20.tar.xz
  https://xyne.dev/projects/python3-threaded_servers/src/python3-threaded_servers-2021.11.20.tar.xz.sig
)
sha512sums=(
  0565226183ba46e2b8cdd6688b2161be5a5a9db5b4f3d32445360cdf3972a873690db23cfcb84cc1ba4b5cf4dfb300d6614aacb83fda46a69c9d3ed0e8821308
  05176f76887de2836c9b74fb85a11e479c608995cfe6cbad144d5ccaa5882c915876cb2dff4158ebd20d1d98d3bc7808a059eff41fe787735252275b6a6404d2
)
md5sums=(
  521f33fe8dacc2e19dcf75fcbfc9d95d
  4a980c1efe58342bf8fb07abf9db8079
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
