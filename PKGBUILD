pkgname=nudgis-obs-plugin
pkgver=1.0.0
pkgrel=2
pkgdesc="OBS plugin for UbiCast Nudgis"
arch=('x86_64')
url="https://github.com/UbiCastTeam/nudgis-obs-plugin"
license=('GPL2')
depends=('obs-studio>=28')
makedepends=('binutils')
source=('https://github.com/UbiCastTeam/nudgis-obs-plugin/releases/download/v1.0.0_OBS-28/nudgis-obs-plugin-1.0.0-linux-x86_64.deb')
sha512sums=('8b33f7a6d5df87de1604f4da864f73fa4a330865250c33d126c4a244eaccaa9b17c64a947fe9eb34d26f22203573bff90f835169f2e9bd04372fcc88cbe1ef9a')

package() {
    ar -x nudgis-obs-plugin-$pkgver-linux-x86_64.deb
    tar -xzf data.tar.gz -C "$pkgdir/"
}
