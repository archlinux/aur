# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=go-aws-sso
pkgver=1.3.0
pkgrel=1
pkgdesc="Make working with AWS SSO on local machines an ease."
arch=("x86_64" "aarch64")
url="https://github.com/theurichde/go-aws-sso"
license=('MIT')
source_x86_64=("https://github.com/theurichde/go-aws-sso/releases/download/v${pkgver}/go-aws-sso_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/theurichde/go-aws-sso/releases/download/v${pkgver}/go-aws-sso_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a5c34f95983a6e53354cc0767efc25967d119456b32c6aecdaa6ae0f1e9f7f9f')
sha256sums_aarch64=('608d579edc1c2912068fb484b7d22166b1089bd8251bffe89f03173bddb6ea24')

package() {
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

