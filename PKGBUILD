#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-threaded_servers
pkgver=2018
pkgrel=1
pkgdesc='Threaded server modules (ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve, Pacserve).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-threaded_servers"
depends=(python3)
optdepends=('pyalpm: required for the Pacserve module')
source=(
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2018.tar.xz
  https://xyne.archlinux.ca/projects/python3-threaded_servers/src/python3-threaded_servers-2018.tar.xz.sig
)
sha512sums=(
  8a3b202aa0e948e237720277b98b3a506c64333e00a50e6557ed97d66107aa5ff24a3b16e417b702e834a1f7adfb0473df914915ee7f91de97360f525f8e2165
  8a8fc7fb517f460971b32634419c82275932c29e0e3ad0ce9b86b4f386c428d78090ebdb5929e08b651717679505576d64033d89dfcf89e3a76390f241d91768
)
md5sums=(
  6657e9df51deaee0c52dcde7c8b4a883
  3cbf4ca0ccc64e5307be2eb6822232a9
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
