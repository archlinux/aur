# Maintainer: networkjanitor <networkjanitor@xyooz.net>
pkgname=raidgrep-bin
pkgver="1.0.0"
pkgrel=1
pkgdesc="Guild Wars 2/arcdps evtc log searching tool. Pre-compiled."
arch=("x86_64")
url="https://gitlab.com/dunj3/raidgrep"
license=("GPL")
provides=("raidgrep")
conflicts=("raidgrep")
depends=("gcc-libs")
source=(
    "https://kingdread.de/raidgrep/raidgrep-1.0.0"
)
sha256sums=('a90be843165990b6b21c52fcfe26f5d08fe7b0c3865e6e1b26e61b0c73f54afe')

package() {
    install -d ${pkgdir}/usr/bin/
    install -D ${pkgname/-bin/}-${pkgver} ${pkgdir}/usr/bin/${pkgname/-bin/}
}

