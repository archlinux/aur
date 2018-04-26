#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2018.4.26
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2018.4.26.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2018.4.26.tar.xz.sig
)
sha512sums=(
  b77a82f462aaa9e7747eb2dadd945177dd3f6ee36b22f4945417a8ddca655f43eec390bf1e687565e0aa8fed4a0535c58a8bb74a6fc41099e42b774627c3bf24
  3a59605f44ed7a5bac715754086fd77801ca5efae18317802a2db276368d889823a2df144f0cb23c9c5d18764a1ec743e4a46538cbada95c4c67f4b3f3d8ea4d
)
md5sums=(
  7886c6ea0315e6af879dc42044e50de9
  011da0b26da41ad464c7ba86516d9fc8
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
