# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=go-aws-sso
pkgver=1.5.1
pkgrel=1
pkgdesc="Make working with AWS SSO on local machines an ease."
arch=("x86_64" "aarch64")
url="https://github.com/theurichde/go-aws-sso"
license=('MIT')
source_x86_64=("https://github.com/theurichde/go-aws-sso/releases/download/v${pkgver}/go-aws-sso_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/theurichde/go-aws-sso/releases/download/v${pkgver}/go-aws-sso_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3ec8924651c101085605dc4b07cdf01b8a85af629bb07b0d7fd9415693a3327c')
sha256sums_aarch64=('1e1b7eba6ac76ef4a0836cb5a233580740d9c9ae6dedf609f4f92189e8842006')

package() {
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

