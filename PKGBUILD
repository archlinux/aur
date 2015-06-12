# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Vladimir Cerny <blackvladimir@gmail.com>
pkgname=crrcsim-models
pkgver=0.2.0
pkgrel=1
pkgdesc="additional models for CRRCsim"
arch=('any')
url="http://crrcsim.berlios.de/wiki/"
license=('GPL')
depends=('crrcsim')
source=("http://prdownloads.sourceforge.net/crrcsim/crrcsim-addon-models-$pkgver.zip")
md5sums=('5f512ce85fc36def17572749886be649')

package() {
  mkdir -p "$pkgdir/usr/share/games/crrcsim/"
  cp "$srcdir/models" "$pkgdir/usr/share/games/crrcsim/" -R
  cp "$srcdir/objects" "$pkgdir/usr/share/games/crrcsim/" -R
  cp "$srcdir/textures" "$pkgdir/usr/share/games/crrcsim/" -R
}

# vim:set ts=2 sw=2 et:
