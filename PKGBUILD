#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2016.10
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('pyalpm: required for the Pacserve module')
source=(
  http://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2016.10.tar.xz
  http://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2016.10.tar.xz.sig
)
sha512sums=(
  8e20e908d612ec47c70ab43778d8dd17577971cc7940866e8e0769f7c0ca4419a893db185e1fe9415d87778363493ec3e126213d79a09a2f701311de5e871fd7
  976df923a60f16d7dc46d92d0340db081a5ec78949d8f1a137f21ec39d5a19be1d3a6ff2ecd754fc565235077632e7186c48b3bf57b1923489791d00ae891369
)
md5sums=(
  4763b5fe7fa9a670daee643b8530c10b
  44f32938af12f5c7ddb4593b699f1b6d
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
