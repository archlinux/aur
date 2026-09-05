# Maintainer: Owen <owen@ericfeldman.com>
pkgname=timbre-bin
_pkgname=timbre
pkgver=0.1.1
pkgrel=1
pkgdesc="A music manager to finally solve this mess of music management"
arch=('x86_64')
url="https://gitea.owendeed.com/Toasterkitten/timbre"
license=('Unlicense')
depends=('cdparanoia' 'flac')
provides=('timbre')
conflicts=('timbre')
source=("timbre-${pkgver}::https://gitea.owendeed.com/Toasterkitten/timbre/releases/download/v${pkgver}/timbre")
sha256sums=('4935cf70f5860ef20c8d143068786c0458f1841dd6a415d3e222a2a27a1eb577')

package() {
    install -Dm755 "${srcdir}/timbre-${pkgver}" "${pkgdir}/usr/bin/timbre"
}
