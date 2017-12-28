# Maintainer: Alan Hardman <alan@phpizza.com>

pkgname=adwaita-xfce-theme-git
pkgver=1.0
pkgrel=1
pkgdesc='A Modified Adwaita GTK Theme, designed and optimized for Xfce.'
arch=('any')
url='https://github.com/thearakattack/adwaita-xfce'
license=('GPL2')
depends=('xfwm4')
makedepends=('git')
optdepends=('xfdesktop: The Xfce desktop')
provides=('adwaita-xfce-theme')
conflicts=('adwaita-xfce-theme')
source=('git+https://github.com/thearakattack/adwaita-xfce.git')
sha256sums=('SKIP')

package() {
    cd adwaita-xfce
    install -dm755 $pkgdir/usr/share/themes
    cp -R * $pkgdir/usr/share/themes/
    rm $pkgdir/usr/share/themes/README.md
}

