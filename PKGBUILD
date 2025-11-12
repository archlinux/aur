# Maintainer: VintageTechie <https://vintagetechie.com>
pkgname=cosmic-updates-git
pkgver=1.1.0
pkgrel=1
pkgdesc="DEPRECATED: Renamed to cosmic-ext-applet-updates-git"
arch=('x86_64')
url="https://github.com/VintageTechie/cosmic-ext-applet-updates"
license=('MIT')
depends=('cosmic-ext-applet-updates-git')
provides=('cosmic-updates')
conflicts=('cosmic-updates')

package() {
    # This is a transitional package
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    echo "This package has been renamed to cosmic-ext-applet-updates-git" > \
        "$pkgdir/usr/share/doc/$pkgname/README"
    echo "Please install cosmic-ext-applet-updates-git instead" >> \
        "$pkgdir/usr/share/doc/$pkgname/README"
}
