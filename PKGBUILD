#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2021.11
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('avahi: Avahi support' 'pyalpm: required for the Pacserve module' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2021.11.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2021.11.tar.xz.sig
)
sha512sums=(
  70040b3e46a89acfef33a4bf07be4e116a4429ee75f572e839f8c8d6b016f6b9263ae143c4cb8945d83bbd38558be5d7981985b1b4db06e6fa121d2baf3c1c3a
  a2ba0b471f66cd5703a3c3519a7010f40117bf75263d93223fca5e0e27591c8fb1cc1c18498f99e1981cfb28bcfbc80989b7426635d1ad894569b4d6b654abf8
)
md5sums=(
  7232734e06079b0673c18cb9d962b3b3
  be22cf69cd368b4b241af811b57b48c0
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
