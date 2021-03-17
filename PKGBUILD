# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>
# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname=tfsec
pkgver=0.39.8
pkgrel=2
pkgdesc="Static analysis powered security scanner for your terraform code"
depends=(glibc)
arch=(x86_64)
url="https://github.com/tfsec/tfsec"
license=('MIT')

source=("https://github.com/tfsec/tfsec/releases/download/v${pkgver}/tfsec-linux-amd64"
        "https://raw.githubusercontent.com/tfsec/tfsec/v${pkgver}/LICENSE")

sha256sums=('d58cb71410a5510e7a3808108d1844c7968c1f017a5f33846c1d3fbd92409600'
            'd59c7e06f84530a8464a352e7b7e153830d566e06aa8ca6a72defa809fad3a37')

package() {
    install -D -m755 "${srcdir}/tfsec-linux-amd64" "${pkgdir}/usr/bin/tfsec"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
