# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=go-aws-sso
pkgver=1.5.2
pkgrel=1
pkgdesc="Make working with AWS SSO on local machines an ease."
arch=("x86_64" "aarch64")
url="https://github.com/theurichde/go-aws-sso"
license=('MIT')
source_x86_64=("https://github.com/theurichde/go-aws-sso/releases/download/v${pkgver}/go-aws-sso_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/theurichde/go-aws-sso/releases/download/v${pkgver}/go-aws-sso_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d1f726b26e29aced1a68d74eef7443ec24b6d04a71e10023f4532d24f752ba3e')
sha256sums_aarch64=('d2438b9c853b4841f67d7a8e2b0cdcbefad6a392cc42696c34d46eac7be9d719')

package() {
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

