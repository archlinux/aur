#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2019.2.27
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2019.2.27.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2019.2.27.tar.xz.sig
)
sha512sums=(
  ce9c547fb5afa94d27f477c50324a496bccf7d5315f120cb8f0422808c0502a7502561779bfa64fbfd0c60943b8cf8fa4b4b6440988a291a5efcded6455e9e55
  10f4753047134357d33b9f74993b0c71155bc81f1f0f79a61a9e345126ee6dbb758d38058c74cf39eb25e955e8080937e2307b0538d11287ff99971fd5c560ae
)
md5sums=(
  987528f6a63f5e4db94f1673cb4e7a43
  9c72762b53bdd9a7f29f56e43526c441
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
