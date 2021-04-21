# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli-bin
pkgver=0.41.0
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
b2sums=('ef3c47dfb651d787746b96117e26f52c4ed25f21ca68ec272845e45bc851b77193c3f59ae04e8713fd24827d499842069b4f4a7680400c41161b01b7eccfa40c'
        'SKIP')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu/ckb-cli"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu/COPYING"
}
