# Maintainer: Slavi Pantaleev <slavi at devture.com>

pkgname=kcl-lang-language-server-bin
pkgver=0.11.0
pkgrel=0
pkgdesc="Language Server Protocol implementation for the KCL configuration language"
arch=('x86_64' 'aarch64')
url="https://github.com/kcl-lang/kcl"
license=('Apache-2.0')

source_x86_64=("https://github.com/kcl-lang/kcl/releases/download/v${pkgver}/kclvm-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/kcl-lang/kcl/releases/download/v${pkgver}/kclvm-v${pkgver}-linux-arm64.tar.gz")

sha256sums_x86_64=('9582f728d765221a8898447d7ec2c28fe9df2699ec1d650d56a18341a55c3dc8')
sha256sums_aarch64=('e95ad9e09c5bb4b31596d4dd061343a7fd6e91d66e0a09985e7afb12321c9c6d')

package() {
    cd kclvm
    install -Dm755 bin/kcl-language-server "${pkgdir}/usr/bin/kcl-language-server"
}
