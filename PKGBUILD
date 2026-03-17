# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=bk-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Double-entry accounting on the command line — SQLCipher-encrypted, multi-tenant"
arch=('x86_64' 'aarch64')
url="https://github.com/Govcraft/beankeeper"
license=('MIT' 'Apache-2.0')
provides=('bk')
conflicts=('bk')

source_x86_64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('11989dd864b3d89bf949ab0c5f1fe315cedfafb446e119439791eb784a7ac0cd')
sha256sums_aarch64=('8210ce84cecef07bd802000182ded9ea3bf5253619caf82ed8ef64c866cad47a')

package() {
    install -Dm755 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/bk" "${pkgdir}/usr/bin/bk"
}
