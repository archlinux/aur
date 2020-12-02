#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2020
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2020.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2020.tar.xz.sig
)
sha512sums=(
  86e5c6bf6b599afb4e9467b002b1cc0c0dbee1c4c80170c17b753a2960973c507d0df84f468c028d993cb805f30e2e43fa2fe4223ebf50a3b4570565c081f7af
  f934a3aca5dc05bc849b8f75aba68375a8214449cb04a7bee24b71f75163a82acdc2dd286a0654ec52a54cc6471b754e65ea8104ffac2d32dd16012ad6f4067d
)
md5sums=(
  c2bcd6e628d63895c64bbab3d44fd47a
  0bffd0fcb0953ceb351c0b3becb50d78
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
