#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2022.9
pkgrel=7
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-threaded_servers"
depends=(python3)
makedepends=(python-setuptools)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.dev/projects/python3-threaded_servers/src/python3-threaded_servers-2022.9.tar.xz
  https://xyne.dev/projects/python3-threaded_servers/src/python3-threaded_servers-2022.9.tar.xz.sig
)
sha512sums=(
  a9556dca91aad8234767cc8dd09620f2b6cd462cc1141a8eac70ca04bdd8b69387393867586eee1c241272b8474eba21f1ecf5701375682c3795bdc4dcc9dbad
  64e3df568cde80405fba7b55050574602781371a6c8fb5618fb1d4e2aa53aa5793474c26d79e4af3e4dec381973389fc9c32a7e65c05db41d553c917c8a2c7b0
)
md5sums=(
  ce7d57eaee6801eeebe335994e69ede3
  5f0c7ae87eb55ff50a2933666fb2a519
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
