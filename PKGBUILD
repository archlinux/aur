# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli-bin
pkgver=0.37.0
pkgrel=2
pkgdesc="Nervos CKB (Common Knowledge Base) command line tool"
arch=('x86_64')
url='https://github.com/nervosnetwork/ckb-cli'
license=('MIT')
conflicts=('ckb-cli')
provides=('ckb-cli')
options=(!strip)
source=("https://github.com/nervosnetwork/ckb/releases/download/v${pkgver}/ckb_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz"{,.asc})
validpgpkeys=('64B705B560781FC540477B824F37F694F4631C0A')
sha256sums=('9ecbacde7de4c22cde7a8b9c4943e510a03c72f38b11aab523d6fc11b90f5497'
            'SKIP')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/ckb_v${pkgver}_x86_64-unknown-linux-gnu/ckb-cli"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/ckb_v${pkgver}_x86_64-unknown-linux-gnu/COPYING"
}
