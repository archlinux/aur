#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2019
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2019.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2019.tar.xz.sig
)
sha512sums=(
  15008f1e6b06e60e3e6bfa0810ae3912230e8c74c2085d38f3dcd4f9694b95462c518bfad8a784c55579b6d645ed974eb522c5fd5fb8844b26665cebde88dae3
  22ae079fe0d399c35651092fd900e3af4143427cc12c8ffb0b30bad2fdb319eb16b8a5119e309ddeaa3cf109d55adf519925bbbdca587f2fcaf650ce02638e49
)
md5sums=(
  d94c83f93c331a516187183fa2794ca4
  5280c5cd2e104eaf5855954e1cf0f05c
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
