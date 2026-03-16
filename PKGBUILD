# Maintainer: rellit <https://github.com/rellit>

pkgname=mdnotes-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple command-line/TUI application for taking notes and managing tasks"
arch=('x86_64')
url="https://github.com/rellit/mdnotes"
license=('MIT')
provides=('mdnotes')
conflicts=('mdnotes')
options=('!strip')

source=("LICENSE::https://raw.githubusercontent.com/rellit/mdnotes/v${pkgver}/LICENSE")
source_x86_64=("mdnotes-${pkgver}-linux-x86_64.tar.gz::https://github.com/rellit/mdnotes/releases/download/v${pkgver}/mdnotes-linux-x86_64.tar.gz")

sha256sums=('8d9eba11351d43d330745d0211cfa89669b61a4257befe5f07aa09676e647e62')
sha256sums_x86_64=('39f62515710f367073dba2bd5c212ab09401310c1477d6582a548c7bf4f902f2')

package() {
    install -Dm755 "${srcdir}/mdn" "${pkgdir}/usr/bin/mdn"
    install -Dm755 "${srcdir}/mdnui" "${pkgdir}/usr/bin/mdnui"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
