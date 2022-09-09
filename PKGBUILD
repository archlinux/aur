# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli-bin
pkgver=1.1.1
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
b2sums=('8fa37752be4529b98211450c49737077d07b0c8c7f7fbfbc01b1f0e29551b6c78d4983f239d9e4f83da0532c364e810bfbe35aaf70ad51e9d2eafcb6f48cba36'
        'SKIP')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu/ckb-cli"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu/COPYING"
}
