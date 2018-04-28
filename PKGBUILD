#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2018.4.28
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2018.4.28.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2018.4.28.tar.xz.sig
)
sha512sums=(
  6d2844bedc965316ccb09f7a49699c577c146426bc022777065d7f725b87fdbfd8e61f6d0a6d935d9bcd6ab61765d4e9a85bdcfd269361ae49e6cab6a5e97940
  b5afce9df86a3bd8a25d3dc5630decf9f2f5c412d441194d540aafe14f2424225e6388f523098df3667df55a77a19fa2790ee578af11aac25ce318793390fda0
)
md5sums=(
  401e10b0cd750f638be2f85d34fa7c09
  6964e1d90afb89b90cad3df4be649555
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
