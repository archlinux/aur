#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2018.6
pkgrel=3
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2018.6.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2018.6.tar.xz.sig
)
sha512sums=(
  c0f03f9e3f870244852d7487530984205fcd84ff83e399094d144dcf721d69eef4797441debada05516a9fafc0df01c5bd988e5e064e9d1e8bcebbcc7f2cf99d
  be95ef87c10b794e8a454b4e1f7f046b60b6a621cfe67e12a1add0dc53a9c8defeb72e95a114a964cac93f72dcfa172daa406deacd22eb3d1f7a83ddb7915f31
)
md5sums=(
  f48ba4727230b8c0e2371005991a5a15
  c2619f82012db0348039576acc084893
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
