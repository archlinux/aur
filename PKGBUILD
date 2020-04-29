# Maintainer: networkjanitor <networkjanitor@xyooz.net>
pkgname=raidgrep-bin
pkgver="1.0.2"
pkgrel=1
pkgdesc="Guild Wars 2/arcdps evtc log searching tool. Pre-compiled."
arch=("x86_64")
url="https://gitlab.com/dunj3/raidgrep"
license=("GPL")
provides=("raidgrep")
conflicts=("raidgrep")
depends=("gcc-libs")
source=(
    "https://kingdread.de/raidgrep/${pkgname/-bin/}-${pkgver}"
)
sha256sums=('7d6d5fe9f0a78dbbe95bc163735bbdecdf8d18f7450927ba6ca178c9221ceec4')

package() {
    install -d ${pkgdir}/usr/bin/
    install -D ${pkgname/-bin/}-${pkgver} ${pkgdir}/usr/bin/${pkgname/-bin/}
}

