# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=go-aws-sso
pkgver=1.6.0
pkgrel=1
pkgdesc="Make working with AWS SSO on local machines an ease."
arch=("x86_64" "aarch64")
url="https://github.com/theurichde/go-aws-sso"
license=('MIT')
source_x86_64=("https://github.com/theurichde/go-aws-sso/releases/download/v${pkgver}/go-aws-sso_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/theurichde/go-aws-sso/releases/download/v${pkgver}/go-aws-sso_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('055e956d1519e454260ee6f2cf789d5d45ab879ec31a0ec99fd80991ef28f0f6')
sha256sums_aarch64=('afcbd1d96331fe43155b57c23895d54327bb3fc651e1aa7d7d6ae719efe345ea')

package() {
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

