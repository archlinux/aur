# Maintainer: CxOrg <clx.org@cloud-org.uk>
#
# Plasma 6 Power Menu applet - a simplified power options menu for KDE Plasma 6 panels.

pkgname=plasma6-applet-power-menu
pkgver=1.0.0
pkgrel=1
pkgdesc="Simplified power options menu widget for KDE Plasma 6 panels"
arch=(any)
url="https://github.com/ixnewton/org.kde.plasma.power-menu"
license=(GPL-2.0-or-later)
depends=(qt6-declarative
         libplasma
         kirigami
         plasma-workspace)
provides=(org.kde.plasma.power-menu)
conflicts=(org.kde.plasma.power-menu)
source=("git+https://github.com/ixnewton/org.kde.plasma.power-menu.git#branch=main")
sha256sums=('SKIP')

package() {
    cd "$srcdir/org.kde.plasma.power-menu"
    install -dm755 "$pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.power-menu"
    cp -a metadata.json contents README.md \
        "$pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.power-menu/"
}
