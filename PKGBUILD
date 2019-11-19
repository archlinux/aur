#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2019.7
pkgrel=2
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2019.7.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2019.7.tar.xz.sig
)
sha512sums=(
  17ca7c7c8a5deb97fb81fc846d86b49b7a229df2508befeb4bcbcef4af8f34bf6ed75eb63923ecb25fe1f42f5a29365e8dcbd77c3831fc8950b1ca2012fddc0f
  2a67e01203db99b6e1cd9e228642a38861e84781a5be1436b5be7e6f3f6b44d1220d10cfda18c68a846359112aa96dd1697456d800c5cc574deddb57fbcb55e8
)
md5sums=(
  6f2fcf9e0bf4f50fc2d8609e2064cf1e
  9fd9c2751876ffac6abd121b17e09112
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
