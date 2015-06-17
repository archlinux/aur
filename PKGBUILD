
# Maintainer: xphnx <xphnx@riseup.net>

pkgname=kde-plasma-themes-midna
pkgver=1.1.0
pkgrel=1
pkgdesc="Mcder's light plasma theme for KaOS."
arch=('i686' 'x86_64')
url="http://kaosx.us"
license=('GPL' 'Creative-Commons-BY-SA-NC')
groups=('kde' 'kdeartwork')
depends=('kdebase-workspace')
#conflicts=('')
source=('http://kaosx.us/repo/apps/kde-plasma-themes-midna-1.1.0-1-x86_64.pkg.tar.xz')
md5sums=('4637a85609ec33f67471d21261da02ee')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/apps/desktoptheme/midna
  cp -R ./usr/share/apps/desktoptheme/midna $pkgdir/usr/share/apps/desktoptheme
  # fix file rights
  chmod 755 -R $pkgdir/usr/share/apps/desktoptheme/midna
} 
