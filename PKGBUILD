# Maintainer:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: Ricky <riccardo_aur at libero dot it>
# Contributor: Adrian Berriel <berriel at gmail dot com>

pkgname=plasma-theme-caledonia
_themename=Caledonia
pkgver=2.0
pkgrel=2
pkgdesc="An elegant and minimalistic dark theme for KDE Plasma"
arch=('any')
license=('CCPL')
url="http://sourceforge.net/projects/caledonia/"
optdepends=('kdebase-workspace: KDE 4 (Plasma 1)'
            'plasma-workspace: Plasma 5')
conflicts=('caledonia-bundle')
source=("http://sourceforge.net/projects/caledonia/files/Caledonia%20%28Plasma-KDE%20Theme%29/$_themename-$pkgver.tar.gz")
sha256sums='3d855b7806d23ad3f748a30e9b0fa94c8ad7ec489fd19a4c026276b3045c5bcc'

package() {
  cd $srcdir

  install -Dm644 $_themename/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname

  install -d $pkgdir/usr/share/apps/desktoptheme
  mv $srcdir/$_themename $pkgdir/usr/share/apps/desktoptheme
  chmod 755 -R $pkgdir/usr/share/apps/desktoptheme/$_themename
}
