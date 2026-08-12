# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Contributor: Kerbiriou Maël <m431.kerbiriou@gmail.com>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=seqkit-bin
_pkgname=seqkit
pkgver=2.13.0
pkgrel=1
pkgdesc="A cross-platform and ultrafast toolkit for FASTA/Q file manipulation in Golang"
arch=('x86_64')
url="https://bioinf.shenwei.me/seqkit"
license=('MIT')
provides=('seqkit')
conflicts=('seqkit')
options=('!strip' '!debug')
source=(
  "https://github.com/shenwei356/seqkit/releases/download/v${pkgver}/seqkit_linux_amd64.tar.gz"
  "https://raw.githubusercontent.com/shenwei356/seqkit/v${pkgver}/LICENSE"
)
sha256sums=('7d686de448464fada1b1988e2e07d693bec68768312da62846bc0e2b502bfc46'
            'ffa76e8a163f7a8785ccf4f517d601d562d2a68fbd019de9b2eccf49c9b89730')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
