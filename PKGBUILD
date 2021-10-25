# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli-bin
pkgver=0.101.0
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
b2sums=('8e140da39c6e4d6ed70793dc1c5cd9680d36ec06c158b211da30479ecdc90309fbf7d638e2da73627650635f3f2e2669accab2d9d588f425c6f3eaf0b17819fc'
        'SKIP')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu/ckb-cli"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu/COPYING"
}
