# Maintainer: S e r g i o  S c h n e i d e r  s p s f 1 9 6 4 at g m a i l dot c o m
# Contributor:	

pkgname=appimagelauncher-bin
_pkgname=appimagelauncher
pkgver=2.2.0.20220908
pkgrel=1
pkgdesc="Helper app that 'makes your Linux desktop AppImage ready™.'"
arch=('x86_64')
license=('MIT')
url="https://github.com/TheAssassin/AppImageLauncher"
provides=("${_pkgname%}")
conflicts=("${_pkgname%}")
depends=('cairo' 'desktop-file-utils' 'hicolor-icon-theme' 'libappimage' 'libbsd' 'libxpm' 'qt5-base' 'shared-mime-info')


source=("https://github.com/TheAssassin/AppImageLauncher/releases/download/continuous/appimagelauncher_2.2.0-gha111.d9d4c73+bionic_amd64.deb")
sha256sums=('e020f79e6f12dfad85633bf2626f6586a5c0663e949c9f54897e837ebdeb8e4f')


package() {
    cd "$srcdir/"
    tar xaf data.tar.xz -C $pkgdir
    cd $pkgdir/usr/share/applications
}

