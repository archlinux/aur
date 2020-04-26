# Maintainer: networkjanitor <networkjanitor@xyooz.net>
pkgname=raidgrep-bin
pkgver="1.0.1"
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
sha256sums=('2021ea4237553c9343a1e0d71df12ca5eb6fa09e557d2cc71f893b399ea3a841')

package() {
    install -d ${pkgdir}/usr/bin/
    install -D ${pkgname/-bin/}-${pkgver} ${pkgdir}/usr/bin/${pkgname/-bin/}
}

