#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=ecryptfs-simple
pkgver=2016.11
pkgrel=1
pkgdesc='A very simple utility for working with eCryptfs.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/ecryptfs-simple"
depends=(ecryptfs-utils util-linux)
source=(
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.11.tar.xz
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.11.tar.xz.sig
)
sha512sums=(
  080aa5a51307cd8c6248f858e47114e15a55cdc05685cc9e695f923d50ba18b79ef5c1365e75d95c88399ef4071582f08c9a86917d4e1f555fa4df4a13bf5f8b
  37232b6dc9b20505b54fc000d0862ed35878e18077ee2853276afc3d8d71289d39e8f98ee7eb29db842e05639fb24be6d94cd3bea957be06bc766b43f28edd86
)
md5sums=(
  c0257331411e656b98727460a7762128
  5964379cf228f8d11763dae04e4a29ad
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

build ()
{
  cd -- "$srcdir/$pkgname-$pkgver"
  ./scripts/helper.sh build
}

package ()
{
  cd -- "${srcdir}/${pkgname}-${pkgver}"
  install -Dm4755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: set ts=2 sw=2 et:
