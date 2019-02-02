#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2019.2
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2019.2.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2019.2.tar.xz.sig
)
sha512sums=(
  508351b8d9ff9d908436c3cf7e7f6f6a2526408473e863cd5f3325b4c8c65ba6f81171f68960136912b6cf16b25b3e46133c1889ce7f6e745460e360fe229103
  47f491abd64f09d6d362f4f0a73e6940c05ac183d82f11414daa4a4aaa9ece41f640956cf8480cdb88595fc6e9a2914eee3dbdab0a83eca1f72a42de9b6ac437
)
md5sums=(
  f6953f1ab64ce2f730aa038a5385896d
  2d787590bb9f84cd5b8b230555accd97
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
