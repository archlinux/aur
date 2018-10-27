# Maintainer: goetzc
# Contributor: danyf90, Ricky, Adrian Berriel

pkgname=plasma5-theme-caledonia
_themename=Caledonia
pkgver=2.0
pkgrel=1
pkgdesc="An elegant and minimalistic dark theme for KDE Plasma 5"
arch=('any')
license=('CCPL')
url="http://sourceforge.net/projects/caledonia/"
depends=('plasma-workspace')
conflicts=('caledonia-bundle')
source=("https://www.dropbox.com/s/raw/4uydrlh15e3ecg3/Caledonia-2.0.tar.gz")
sha256sums=('3d855b7806d23ad3f748a30e9b0fa94c8ad7ec489fd19a4c026276b3045c5bcc')

package() {
  cd $srcdir

  install -Dm644 $_themename/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname

  install -d $pkgdir/usr/share/plasma/desktoptheme/
  mv $srcdir/$_themename $pkgdir/usr/share/plasma/desktoptheme/
  chmod 755 -R $pkgdir/usr/share/plasma/desktoptheme/$_themename
}
