# Maintainer: rellit <https://github.com/rellit>

pkgname=mdnotes-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="A simple command-line/TUI application for taking notes and managing tasks"
arch=('x86_64')
url="https://github.com/rellit/mdnotes"
license=('MIT')
provides=('mdnotes')
conflicts=('mdnotes')

source=("LICENSE::https://raw.githubusercontent.com/rellit/mdnotes/v${pkgver}/LICENSE")
source_x86_64=("mdnotes-${pkgver}-linux-x86_64.tar.gz::https://github.com/rellit/mdnotes/releases/download/v${pkgver}/mdnotes-linux-x86_64.tar.gz")

sha256sums=('8d9eba11351d43d330745d0211cfa89669b61a4257befe5f07aa09676e647e62')
sha256sums_x86_64=('5958c9e76b48ed1bb44c59cbfd90d2927c45a6ae8b58e09879cd66534178932f')

package() {
    install -Dm755 "${srcdir}/mdn" "${pkgdir}/usr/bin/mdn"
    install -Dm755 "${srcdir}/mdnui" "${pkgdir}/usr/bin/mdnui"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
