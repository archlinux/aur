# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli-bin
pkgver=0.39.0
pkgrel=1
pkgdesc="Nervos CKB (Common Knowledge Base) command line tool"
arch=('x86_64')
url='https://github.com/nervosnetwork/ckb-cli'
license=('MIT')
conflicts=('ckb-cli')
provides=('ckb-cli')
options=(!strip)
source=("https://github.com/nervosnetwork/ckb-cli/releases/download/v${pkgver}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz"{,.asc})
validpgpkeys=('64B705B560781FC540477B824F37F694F4631C0A')
b2sums=('cd2f1a6566b302baf135e61b1961da9c742908a8fa46a0861b0cd52f3618d5eb07622dc45d5e73a6d2725deae43b98a2dbfddc6f02a6274b7dbd5d2dd5b1b2cb'
        'SKIP')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu/ckb-cli"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu/COPYING"
}
