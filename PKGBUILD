#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2021.9
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2021.9.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2021.9.tar.xz.sig
)
sha512sums=(
  28a86c3db8305dba848d25e0bb9ebe87040b6c2815610b9a921c62d82a979f945c79679bebc9690109728482ee653275432c5e05b74965dce9545638f9f53145
  be6e7b3244b05f54f2362befe4613b896fa10e50976d1a36605eaee3b8230328968199c997104d8f5b5c49aac3e1658380063c1c93eebc1c648f12ad41f0fd1a
)
md5sums=(
  aec14c7d0486d9841914e0d5ec7e5c17
  e982d9dd77be7c71f1deabd7558138b6
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
