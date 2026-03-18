# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=bk-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Double-entry accounting on the command line — SQLCipher-encrypted, multi-tenant"
arch=('x86_64' 'aarch64')
url="https://github.com/Govcraft/beankeeper"
license=('MIT' 'Apache-2.0')
provides=('bk')
conflicts=('bk')

source_x86_64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('362b13199591d2e38075b31cf565227a49b3c192e8b250f5c26a15ab83e0b2e3')
sha256sums_aarch64=('23dd7da738ad0035cb9e3c671961be0abe3b68cf5f274b84b7d011e1e966aac6')

package() {
    install -Dm755 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/bk" "${pkgdir}/usr/bin/bk"
}
