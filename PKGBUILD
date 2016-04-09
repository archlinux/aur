# Maintainer: Michael Tiebesl <email@tiebesl.com>

pkgname=masalla-icon-theme
pkgver=0.9
pkgrel=1
pkgdesc="A flat design icon theme by Hayder Majid"
arch=('any')
url="https://github.com/hayderctee/masalla-icon-theme"
license=('GPL3')
depends=()
makedepends=('git')
optdepends=()
conflicts=('masalla-icon-theme-git')
source=('git+https://github.com/hayderctee/masalla-icon-theme.git')
sha256sums=('SKIP')

package() {
  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/Masalla

 # install theme
  cd $srcdir/$_pkgname/masalla-icon-theme
  cp -r . "$pkgdir"/usr/share/icons/Masalla
}

