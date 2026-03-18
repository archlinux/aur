# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=bk-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Double-entry accounting on the command line — SQLCipher-encrypted, multi-tenant"
arch=('x86_64' 'aarch64')
url="https://github.com/Govcraft/beankeeper"
license=('MIT' 'Apache-2.0')
provides=('bk')
conflicts=('bk')

source_x86_64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('3f865dfc1ac9223ab2a7708f53e9d9ea0dcef4eddcc3fa7563688430b740943a')
sha256sums_aarch64=('4070362d248695a903520d5972c09239c1eaceab7ff9d56b7a728a5166d98e3a')

package() {
    install -Dm755 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/bk" "${pkgdir}/usr/bin/bk"
}
