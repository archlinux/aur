pkgname=nudgis-obs-plugin
pkgver=1.0.0
pkgrel=4
pkgdesc="OBS plugin for UbiCast Nudgis"
arch=('x86_64')
url="https://github.com/UbiCastTeam/nudgis-obs-plugin"
license=('GPL2')
depends=('obs-studio>=30')
makedepends=('binutils')
source=('https://github.com/UbiCastTeam/nudgis-obs-plugin/releases/download/v1.0.0_OBS-30/nudgis-obs-plugin-1.0.0-x86_64-linux-gnu.deb')
sha512sums=('57fa5782876c7204b213179bb4102b87f194bc7744ead523461c0ca62e1aa3b20e2eae4ecca34e3d276f5cac0d56388a0de468384fbda97894688a5f9a56268e')

package() {
    # ar -x nudgis-obs-plugin-$pkgver-linux-x86_64.deb
    tar -xzf data.tar.gz --transform 's/\blocal\b//' -C "$pkgdir/"
}
