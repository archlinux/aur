# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=bk-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Double-entry accounting on the command line — SQLCipher-encrypted, multi-tenant"
arch=('x86_64' 'aarch64')
url="https://github.com/Govcraft/beankeeper"
license=('MIT' 'Apache-2.0')
provides=('bk')
conflicts=('bk')

source_x86_64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a793789c826ea9632f3784f446272b16a146e40e1d6940f57cd95d64ffcdc513')
sha256sums_aarch64=('39b5f75fe65dc6b31e0198d79a4c42a68f739f0ebc1d770767587e390326c8c3')

package() {
    install -Dm755 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/bk" "${pkgdir}/usr/bin/bk"
}
