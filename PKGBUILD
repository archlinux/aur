# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=go-aws-sso
pkgver=1.5.4
pkgrel=1
pkgdesc="Make working with AWS SSO on local machines an ease."
arch=("x86_64" "aarch64")
url="https://github.com/theurichde/go-aws-sso"
license=('MIT')
source_x86_64=("https://github.com/theurichde/go-aws-sso/releases/download/v${pkgver}/go-aws-sso_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/theurichde/go-aws-sso/releases/download/v${pkgver}/go-aws-sso_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('aec86c28da683d404a3c5ebedf63a448d275a52c014db9e9e824bd25b66a8c6d')
sha256sums_aarch64=('cd6ff512af77028e1c0de85953f938fecc1fadab04c065a5387d56c110d0bdaf')

package() {
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

