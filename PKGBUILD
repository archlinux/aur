# Maintainer: dctxmei <dctxmei@gmail.com>
# Maintainer: Jeremy Pope <jpope at jpope dot org> PGP-Key: E00B4261
pkgname=breeze-hacked-cursor-theme-git
pkgver=1.0
pkgrel=4
pkgdesc="Breeze Hacked cursor theme."
arch=('any')
url="https://kver.wordpress.com/2015/01/09/curses-i-mean-cursors/"
license=('GPL')
source=("https://static.dct.party/data/breeze-hacked-cursor-theme.zip")
makedepends=('unzip')

sha256sums=('49a4ded5447c726e06151104bc656eca99f88db9751d240f020b7ce811acb15a')

package() {
    cd $srcdir/Breeze_Hacked
    install -d $pkgdir/usr/share/icons/Breeze_Hacked
    cp -rf *   $pkgdir/usr/share/icons/Breeze_Hacked
    chmod -R 644 $pkgdir/usr/share/icons/Breeze_Hacked/*
    chmod 755 $pkgdir/usr/share/icons/Breeze_Hacked
    chmod 755 $pkgdir/usr/share/icons/Breeze_Hacked/cursors
}
