# Maintainer: networkjanitor <networkjanitor@xyooz.net>
pkgname=raidgrep-bin
pkgver="v0.1"
pkgrel=1
pkgdesc="Guild Wars 2/arcdps evtc log searching tool. Pre-compiled."
arch=("x86_64")
url="https://gitlab.com/dunj3/raidgrep"
license=("GPL")
provides=("raidgrep")
conflicts=("raidgrep")
depends=("gcc-libs")
source=(
    "https://kingdread.de/raidgrep/raidgrep"
)
sha256sums=('d3e1361f21cfd633ab8553ee33ce29f18b4fc5efa33232dbbf0a63d9000fc268')

package() {
    install -d ${pkgdir}/usr/bin/
    install -D ${pkgname/-bin/} ${pkgdir}/usr/bin/${pkgname/-bin/}
}

