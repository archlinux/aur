#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2019.1
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2019.1.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2019.1.tar.xz.sig
)
sha512sums=(
  3170c898b1a5c66f29653da3cab1997a766c334813d12c1b67e413ba4c72f46b427c2c9c4dc3c439063667be77622e5f6069d889339cfdbe820d9a90feacd749
  3942dae36d18ddbfa4dfe67394be9161b72569ce1a8428b5d9f091cf25411916bdf602eed6cbf6cea0247039cb0f1ce687257289f4b87d85c889145788eeaf50
)
md5sums=(
  4f4cef8fe3b6af02107feb1a9a46629f
  177b1b9524990af4462a05e793aacb70
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
