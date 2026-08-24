# Maintainer: Owen <owen@ericfeldman.com>
pkgname=timbre-bin
_pkgname=timbre
pkgver=0.1.0
pkgrel=1
pkgdesc="A music manager to finally solve this mess of music management"
arch=('x86_64')
url="https://gitea.owendeed.com/Toasterkitten/timbre"
license=('Unlicense')
depends=('cdparanoia' 'flac')
provides=('timbre')
conflicts=('timbre')
source=("timbre-${pkgver}::https://gitea.owendeed.com/Toasterkitten/timbre/releases/download/v${pkgver}/timbre")
sha256sums=('7c351182b242d36bd9a4d7c89853ba80ed425a666b69a4fbed74efa5a8c26a8b')

package() {
    install -Dm755 "${srcdir}/timbre-${pkgver}" "${pkgdir}/usr/bin/timbre"
}
