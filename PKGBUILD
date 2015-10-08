# Maintainer: Nattapong Pullkhow <exenatt at gmail dot com>
# Contributor: Nattapong Pullkhow <exenatt at gmail dot com>
# Updated for AUR by Robbie <zoqaeski at gmail dot com>

pkgname=xenlism-wildfire-icon-theme
pkgver=2.0.2
pkgrel=1
pkgdesc="Minimalism And Realism Mix and match, Meego And iOS icon Style"
url="https://xenlism.github.io/wildfire"
arch=('any')
license=('GPL')
source=("https://github.com/xenlism/wildfire/archive/master.tar.gz")
install=xenlism-wildfire.install
sha256sums=('45b9499c108d0117184641b3ed29ac4a089bd28b47cc1fe6f27dc77c03f5fea9')

package() {
  install -dm755 "${pkgdir}/usr/share/icons"
  cd "${srcdir}/wildfire-master/icons/"
  cp -r * "${pkgdir}/usr/share/icons/";
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
  install -dm755 "${pkgdir}/usr/share/backgrounds/gnome/"
  cd "${srcdir}/wildfire-master/wallpapers/";
  install -dm755 "${pkgdir}/usr/share/backgrounds/xenlism/";
  cp -r * "${pkgdir}/usr/share/backgrounds/xenlism/";
  find "${pkgdir}/usr/share/backgrounds/xenlism/" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/backgrounds/xenlism/" -type f -exec chmod 644 '{}' \;
  cd "${srcdir}/wildfire-master/background-properties/";
  install -dm755 "${pkgdir}/usr/share/gnome-background-properties/";
  cp -r * "${pkgdir}/usr/share/gnome-background-properties/";
  find "${pkgdir}/usr/share/gnome-background-properties/" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/gnome-background-properties/" -type f -exec chmod 644 '{}' \;
}

