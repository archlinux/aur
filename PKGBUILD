# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli-bin
pkgver=0.100.0
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
b2sums=('e1d3ddfd4fb65372982bf8dc7a9038e24539e81b12c3521b0c88ef3a971e367c7d00877515f7cd04e7b8763e7f82b22b0d2b519cbcfbd566851d2f97bda5090b'
        'SKIP')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu/ckb-cli"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu/COPYING"
}
