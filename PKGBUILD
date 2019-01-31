#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2019.1.31
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2019.1.31.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2019.1.31.tar.xz.sig
)
sha512sums=(
  4d29bb60b8ce5e8f808e0929070d64e9ba524205e2156a69bd3e60262b774e207cdc80dafe90fa2c0bf7a75891a5753bbc6359c21e765011dd121d3e21a402e5
  6407ba5b3881c278ee525c6c085b4a7455b2ea5117fb8f2449ae1533ce3b8259e955e3c890aebd63138060d62bbcbbf11c2b03596c45fe3c4322b5788fe9d1ca
)
md5sums=(
  45078f327f4d1d8a87c4d6d615fe3d46
  461bbc555f816b76058bfbedbd904999
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
