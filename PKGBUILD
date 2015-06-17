
# Maintainer: xphnx <xphnx@riseup.net>

pkgname=kde-ksplash-themes-midna
pkgver=2.0.0
pkgrel=1
pkgdesc="Midna KSplash-Theme, based on litho flowers for KaOS."
arch=('i686' 'x86_64')
url="http://kaosx.us"
license=('GPL')
groups=('kde' 'kdeartwork')
#depends=('')
#conflicts=('')
source=('http://kaosx.us/repo/apps/kde-ksplash-themes-midna-2.0.0-1-x86_64.pkg.tar.xz')
md5sums=('296fff476bdd008808c43bae97fe44a3')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/apps/ksplash/Themes/midna
  cp -R ./usr/share/apps/ksplash/Themes/midna $pkgdir/usr/share/apps/ksplash/Themes
  # fix file rights
  chmod 755 -R $pkgdir/usr/share/apps/ksplash/Themes/midna
} 
