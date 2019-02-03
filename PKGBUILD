#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2019.2.3
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2019.2.3.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2019.2.3.tar.xz.sig
)
sha512sums=(
  bc92858b23ed9f3aff5e57dbe83803e6109bcce020e1fd4f677f765da70ff66c0a4e91c001fe536d53390d6cf7bea118356ef8d82fadeaafb4f487798ac51a92
  18e088dd49fde80861b27655ced2885ca2a457f82bd90733d393070aceab30af84d0ba342c23fa50c7d597cb35850da0880501d42ae51fe236bfa909e017e13d
)
md5sums=(
  e881436b71b55c1b666486f78aac51e7
  f8bc8d793e9c92738bc89c4314867fe8
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
