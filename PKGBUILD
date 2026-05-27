# Maintainer: Davide Carnemolla <herbrant@protonmail.com>
pkgname=codexbar-cli
pkgver=0.30.0
pkgrel=1
pkgdesc='AI coding provider usage tracker CLI'
arch=('x86_64' 'aarch64')
url='https://github.com/steipete/CodexBar'
license=('MIT')

provides=('codexbar')
conflicts=('codexbar')

source=("LICENSE::https://raw.githubusercontent.com/steipete/CodexBar/v${pkgver}/LICENSE")
source_x86_64=("CodexBarCLI-v${pkgver}-linux-x86_64.tar.gz::https://github.com/steipete/CodexBar/releases/download/v${pkgver}/CodexBarCLI-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("CodexBarCLI-v${pkgver}-linux-aarch64.tar.gz::https://github.com/steipete/CodexBar/releases/download/v${pkgver}/CodexBarCLI-v${pkgver}-linux-aarch64.tar.gz")

sha256sums=('14293556b79940745123d0160c71d27ed0e9fe9b8a848093f3ed78f4853caafe')
sha256sums_x86_64=('cb638ba68fd7ef2e4b43b4899fd66720a330b9458346fb66207e9b5813b6e6f3')
sha256sums_aarch64=('78cfe45b5cd77a985362f749d1995742518cee706efc1931218f02c583f13681')
package() {
    install -Dm755 CodexBarCLI "${pkgdir}/usr/bin/codexbar"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 VERSION "${pkgdir}/usr/share/${pkgname}/VERSION"
}
