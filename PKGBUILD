# Maintainer: Yuzu Vita <g311571057 at gmail dot com>
pkgname=plasma6-applets-catwalk
pkgver=2.4
pkgrel=1
pkgdesc="A simple plasmoid showing the total CPU usage. Visually made like RunCat."
arch=('any')
url="https://store.kde.org/p/2137844"
license=('GPL-2.0-or-later')
depends=(bash ksvg libksysguard libplasma qt6-declarative kcmutils kirigami)
source=("org.kde.plasma.catwalk.tar.gz")
sha256sums=('05b3d8516d9a76f351cbb2a18a3cf6b6c1ad224f78b1b88ee43f790123ce1007')
options=(!emptydirs)

package() {
    install -d "$pkgdir/usr/share/plasma/plasmoids/"
    cp -r org.kde.plasma.catwalk "$pkgdir/usr/share/plasma/plasmoids/"
}
