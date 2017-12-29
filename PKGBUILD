# Maintainer: Alan Hardman <alan@phpizza.com>

pkgname=zephyr-gtk-theme-git
pkgver=1.0
pkgrel=1
pkgdesc='A dark pastel GTK theme built for Xfce, based on Breeze Dark'
arch=('any')
url='https://alanaktion.github.io/zephyr-gtk/'
license=('LGPL')
depends=()
makedepends=('gtk2'
             'gtk3'
             )
optdepends=('gtk2: GTK+2 theme'
            'gtk3: GTK+3 theme'
            )
provides=('zephyr-gtk-theme')
conflicts=('zephyr-gtk-theme')
source=('git+https://github.com/Alanaktion/zephyr-gtk.git')
sha256sums=('SKIP')

package() {
    install -dm755 $pkgdir/usr/share/themes
    cp -R zephyr-gtk $pkgdir/usr/share/themes/Zephyr
    rm -rf $pkgdir/usr/share/themes/Zephyr/.git
}

