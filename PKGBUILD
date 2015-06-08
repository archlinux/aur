# Maintainier: FadeMind <fademind@gmail.com>

pkgname=ksplash-reality
pkgver=13.2
pkgrel=1
pkgdesc="Animated splash screen inspiration openSUSE. Welcome."
arch=('any')
license=('GPL' 'CCPL:by-sa')
url="http://kde-look.org/content/show.php?content=169312"
depends=('kdebase-workspace')
source=("${pkgname}-${pkgver}.tar.gz::http://opendesktop.org/CONTENT/content-files/169312-Reality_1.tar.gz")
sha256sums=('3800a0a612fc8747bc0abba2a43995cf629ba45104a8c6efcfa9248a22e077a8')
  
package() {
  cd ${srcdir}/Reality
  mkdir -p ${pkgdir}/usr/share/apps/ksplash/Themes/Reality
  cp -R * ${pkgdir}/usr/share/apps/ksplash/Themes/Reality
  find ${pkgdir}/usr -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
  find ${pkgdir}/usr -type f -name '.directory' -delete
}
