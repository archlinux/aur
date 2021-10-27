# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli-bin
pkgver=0.101.1
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
b2sums=('d426d3294d28909f48ec56780f79c1b960fc662642f3a15c5e6c5b48ee424aeb545950fc146ca3b51b9e67cf3bb23aec0279edf966fa4a72aacb9a4a5522c2f5'
        'SKIP')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu/ckb-cli"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu/COPYING"
}
