#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2018.12.24.1
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2018.12.24.1.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2018.12.24.1.tar.xz.sig
)
sha512sums=(
  44a00e133cc24f942ae62e46b4cc82cff43242629e7f7b9aca3085a514d92f12d238e98676c75adefe286b616de3f1803a8d7ffd49643a9e39928977aba54a5c
  af7ba191d7c411b8008363a499be68fa78b99da723781865966e8b06574b14d1a4a9dba5bf03db4e29c2077d9617d0bc33c74c162a1fe763426aa32fe7c76aba
)
md5sums=(
  e597bd0bfbfdbf0a709429d62c7366ed
  c7a299e5c4ad6ce85654cdbbb64d55b2
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
