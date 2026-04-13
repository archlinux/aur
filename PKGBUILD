# Maintainer: Laurent Baaziz <balaurent@users.noreply.github.com>
pkgname=deez-notes-bin
pkgver=0.3.0
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
sha256sums=('a30d52ba7fc5879c89a4442f5b990d6d8d27e7c152414c7a8fdf7dd0b4aa6b3e'
            'SKIP')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/deez-notes"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
