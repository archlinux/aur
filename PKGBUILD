#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=ecryptfs-simple
pkgver=2015
pkgrel=1
pkgdesc='A very simple utility for working with eCryptfs.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/ecryptfs-simple"
depends=(ecryptfs-utils util-linux)
source=(
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2015.tar.xz
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2015.tar.xz.sig
)
sha512sums=(
  21f34eb2eed367299de9e02bd73130440b4ba6f373e94802d022501b2b4bd137b0534dccbe2bdfc936da307bebd94e3fc81d386dea07eb41f16f54218a4e3bd9
  d83938b1c65def46291d74cc81ac6589674c762dadf1990487b3de6deaa387cc43fc542a2330fbb84802e4ddd2dcc1657f5c4ae197b7f1e2cdfe240a2b27aada
)
md5sums=(
  677c13ee3ec8cd3aec7315116aed44f0
  2ab85e5b22d3c415f7b7de6e75fa29b6
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
