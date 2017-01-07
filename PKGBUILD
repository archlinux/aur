#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2016.10.17
pkgrel=3
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('pyalpm: required for the Pacserve module')
source=(
  http://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2016.10.17.tar.xz
  http://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2016.10.17.tar.xz.sig
)
sha512sums=(
  1d9057fc93298da39de648486414d2fb16325740e261e5381b5158c05fa2c363e1cb21946716c608a293584bb2a74bcb10a1f6af6bd74c6c884152f8f09098c0
  00ef5776ec8246df74caa32d58059f820e500a2b9154b34c1ea60158d803cefc0371bea1cc66c946c7c461f4e306ca331fcd78e7dfb6afd28a15425d66d403ea
)
md5sums=(
  219915559d5c4b3a822d93b448aee597
  b04d296bf881f608f69f05029b31c976
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
