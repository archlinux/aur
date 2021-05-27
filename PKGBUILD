# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli-bin
pkgver=0.42.1
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
b2sums=('1b41350cee0a6ddaf23f4dd71e721961a2796974ffe046bc1d4799369213b2e839a27875e5447c0c1e91184123362f421d1fb956b6b87a49528a6d9c5f079031'
        'SKIP')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu/ckb-cli"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/ckb-cli_v${pkgver}_x86_64-unknown-linux-gnu/COPYING"
}
