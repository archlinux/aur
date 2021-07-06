#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2021
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2021.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2021.tar.xz.sig
)
sha512sums=(
  b98bb5364280ee7e3696c267a48f26d9e9e7b0cc184a162b12bf6192a4b498c416a10f6565cc58ef8e511df6245fc1d064c352a4bba7bb494d29bf5d33b4af1f
  604f616a1891289c0b81bcb5d943fdf8df08983f84215b17b3393b486f25d6b0022d00247c8174a6a768c539013c3a081fb76855d2b84e13abfe18e6b3f6326b
)
md5sums=(
  3731f51f997f0923cb183746a00756cd
  acf3e0c025ecdf3434c59dd2e06d7400
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
