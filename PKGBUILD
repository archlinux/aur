#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2016
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('pyalpm: required for the Pacserve module')
source=(
  http://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2016.tar.xz
  http://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2016.tar.xz.sig
)
sha512sums=(
  0dd00e59a5c3f7b15b5fbac7575e65bf86fb20ef743bde4a62798f1aaebfc18afbe6774d735b923aacceac3b912ec06028d871c72a0a5de755b5665c333cd4f8
  06f5ed1d0ece841121c886ed9c68aafd98eeca6b880923b98ae4a2708740de11299060146d077cf8822c2b4e83d807fd4bdb7a59766ea2518390437f886c9928
)
md5sums=(
  936788e0307520fa48b60e3f2f5636ae
  9f59717136be0ec6c9468dc620230fbe
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
