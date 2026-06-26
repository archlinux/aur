# Maintainer: Laurent Baaziz <balaurent@users.noreply.github.com>
pkgname=deez-notes-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A TUI Markdown note manager with fuzzy search, themes, and folder organization"
arch=('x86_64')
url="https://github.com/BaLaurent/deez-notes"
license=('MIT')
provides=('deez-notes')
conflicts=('deez-notes')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}::https://github.com/BaLaurent/deez-notes/releases/download/v${pkgver}/deez-notes-linux-amd64"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/BaLaurent/deez-notes/master/LICENSE")
sha256sums=('60a5423a6ef1fb3031543b4c7cac175dd4afb0682dfc48ee7be3ba7d5d0b7c61'
            'SKIP')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/deez-notes"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
