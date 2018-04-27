#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2018.4.27
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2018.4.27.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2018.4.27.tar.xz.sig
)
sha512sums=(
  462d9aea2720be306184790a10526909ab6be7c4ad9bae341d0d02d093c60c2bd421428051685627ab9d43a3d07e949de770b9d5fa3cfb8edc4ae8cabbe0f62f
  b41ad5e31e852952f695f59ecbc6781031c5eae3b4e209060b1f2913fc3b86381f78f48acad83a78e360973ea92b3d15072768974f42d1091c8035e119a7c6cf
)
md5sums=(
  9ef6f5368d12615166f3c2a930d6a7ed
  175869429b1a0caeb17a426f0f4afa31
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
