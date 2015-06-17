# Maintainer: M0Rf30

pkgname=kde-kdm-themes-midna
pkgver=2.0
pkgrel=2
pkgdesc="KaOS grey KDM-Theme."
arch=('i686' 'x86_64')
url="http://kaosx.us"
license=('GPL')
groups=('kde' 'kdeartwork')
depends=('kdebase-workspace')
#conflicts=('')
source=("http://kaosx.us/repo/apps/$pkgname-$pkgver-1-x86_64.pkg.tar.xz")
md5sums=('0f3d89b4559d22734a93d5ae69f77eda')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/apps/kdm/themes/midna
  cp -R ./usr/share/apps/kdm/themes/midna $pkgdir/usr/share/apps/kdm/themes
  # fix file rights
  chmod 755 -R $pkgdir/usr/share/apps/kdm/themes/midna
}
