#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svg2ggr
pkgver=2012
pkgrel=2
pkgdesc='Extract gradients from svg files and save them to Gimp gradient files (ggr).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/svg2ggr"
depends=(python2)
source=(
  http://xyne.archlinux.ca/projects/svg2ggr/src/svg2ggr-2012.tar.xz
  http://xyne.archlinux.ca/projects/svg2ggr/src/svg2ggr-2012.tar.xz.sig
)
sha512sums=(
  8e1b183044f98063876f11b0181f8fea9e41199601a8b9c3d2aeb64ec8b1b9817717003b9a665db3849935ca76638951748013df0ba2dd670517a2409c689a4e
  fbb7c3f73d164b500dc8a0284ffdc45661606e7c55629d39ae2786af70ea266581501d5ec6c8a55a7a4f53189b666633dbac2cf944a9c5911e5f6cfc866a1774
)
md5sums=(
  f170e57058b7608d64849ffe1fff1be5
  2eeab763ba4c56502d9d0f1593f53cf6
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
