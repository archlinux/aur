#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-colorsysplus
pkgver=2018.8
pkgrel=2
pkgdesc='An extension of the standard colorsys module with support for CMYK, terminal colors, ANSI and more.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-colorsysplus"
depends=(python3)
source=(
  https://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2018.8.tar.xz
  https://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2018.8.tar.xz.sig
)
sha512sums=(
  9e2e44278c226e6d2ce4c943d7e7d759063b1a223ba89bfd32b4418d8dde9658c068789779bdb443436aae7f83a32a3f4eaa8d2c5bbf2464c08d51dab2add248
  9a5bd8bff46500449c9c0c0340e5ddb104b44e0776702787330f41f16a25972bfebd7a147cc1f6d636928324e559527095c20551dc5341b0f40d0bb037766625
)
md5sums=(
  bac33c3f0e220a4bdd61f580dd727383
  ee8d1777b832495daffd298e4447f120
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 ctconv "$pkgdir/usr/bin/ctconv"
}


# vim: set ts=2 sw=2 et:
