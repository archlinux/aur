# Maintainer: Airlongdian <Airlongdian@gmail.com>
pkgname=meowsans-ttf
pkgver=1.0.0
pkgrel=1
pkgdesc=" JetbrainsMono + OPlusSans3 + NerdIcon"
arch=('any')
url="https://github.com/AirLongDian/MeowSans_Font"
license=('unknown')
source=("https://github.com/AirLongDian/MeowSans_Font/releases/download/v1.0.0/MeowSans.ttf"
        "https://github.com/AirLongDian/MeowSans_Font/releases/download/v1.0.0/MeowSansNerd.ttf")
sha256sums=("SKIP"
	"SKIP")

package() {
	mkdir -p "${pkgdir}/usr/share/fonts/TTF"
	cp ${srcdir}/MeowSans.ttf ${pkgdir}/usr/share/fonts/TTF/
	cp ${srcdir}/MeowSansNerd.ttf ${pkgdir}/usr/share/fonts/TTF/
}
