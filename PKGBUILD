#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2014.11
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('pyalpm: required for the Pacserve module')
source=(
  http://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2014.11.tar.xz
  http://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2014.11.tar.xz.sig
)
sha512sums=(
  70c72f8e34a46f4e821165d36639a41920a2d05a8ec71373946690af8b82d0a4e9861ddb751324ab0b298096d6cd012c4dafb18188686fe01d033730d0d41088
  d8703765864287e42c7392ce4c8937d2e6b08e109030fbe5ba50467a4096cc7523c641b21a7d76d8147c4285d24df81f6ef14fc727c29d68ff5160752a3b4300
)
md5sums=(
  5179fbd600c420da4631cf3701963211
  2d40be7e044e5c698bf903681df854cf
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
