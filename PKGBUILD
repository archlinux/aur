# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli-bin
pkgver=1.14.0
pkgrel=1
pkgdesc="Nervos CKB (Common Knowledge Base) command line tool"
arch=('x86_64')
url='https://github.com/nervosnetwork/ckb-cli'
license=('MIT')
conflicts=('ckb-cli')
provides=('ckb-cli')
options=(!strip)
source=("https://github.com/nervosnetwork/ckb-cli/releases/download/v${pkgver}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz"{,.asc})
validpgpkeys=('8D09AC56856F84AFDB2CEB12E21C4F2E34FF2E93')
b2sums=('abcac6ed9eb8578223710e7cebe0f47e735b5d8e9347f2995fac342463762fe016c647c93dcc738d3c1b2c029b053ced40c479f28b425e6fa43fbd7c87d99531'
        'SKIP')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu/ckb-cli"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu/COPYING"
}
