# Maintainer: vmvarela <vmvarela@gmail.com>
pkgname=sql-pipe
pkgver=0.27.1
pkgrel=1
pkgdesc="Read CSV via stdin, run SQL, emit CSV via stdout"
arch=('x86_64' 'aarch64')
url="https://github.com/vmvarela/sql-pipe"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("LICENSE::https://raw.githubusercontent.com/vmvarela/sql-pipe/v${pkgver}/LICENSE")
sha256sums=('aa0a1ee0bc207810098f0c95dce3cd21e47dca12b9fbd642ddfaff418b199faf')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/vmvarela/sql-pipe/releases/download/v${pkgver}/sql-pipe-x86_64-linux")
sha256sums_x86_64=('6a230bbdf1e5ba8cd524eb90a474b6d5f7c6cb9509268744e16ef3578a8fe87d')

source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/vmvarela/sql-pipe/releases/download/v${pkgver}/sql-pipe-aarch64-linux")
sha256sums_aarch64=('60dd0e5e48331cbe47049491f2733cd6ebaedc306365e3eb0a7470c8cdeeeb50')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
