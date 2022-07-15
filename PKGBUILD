#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=svg2ggr
pkgver=2012
pkgrel=5
pkgdesc='Extract gradients from svg files and save them to Gimp gradient files (ggr).'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/svg2ggr"
depends=(python2)
source=(
  https://xyne.dev/projects/svg2ggr/src/svg2ggr-2012.tar.xz
  https://xyne.dev/projects/svg2ggr/src/svg2ggr-2012.tar.xz.sig
)
sha512sums=(
  8e1b183044f98063876f11b0181f8fea9e41199601a8b9c3d2aeb64ec8b1b9817717003b9a665db3849935ca76638951748013df0ba2dd670517a2409c689a4e
  335b7eae4cd12c062dd5dbb7274422865d54da01973835c900aa324f6fe6e0370580cb8aa645e2e848c18a98e401bf584ff9958205a1dc676d3ed44d6548cb38
)
md5sums=(
  f170e57058b7608d64849ffe1fff1be5
  764f3bf20435efbc179323f996a72e38
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
