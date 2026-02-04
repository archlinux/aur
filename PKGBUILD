# Maintainer: LY <ly-niko@qq.com>

_pkgname=hpcgame
pkgname=hpcgame-kube-cli-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="HPCGame Kube CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/hpcgame/hpcgame-kube-cli"
license=('MIT')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz")

sha256sums_x86_64=('5be52915f96340f23fd03a143e8e129d64acf11dc1584b6bd6a9d29ad5e8791e')
sha256sums_aarch64=('3e315e7916d4ea605dcf123c5cda73c07d6f5d44d8d508eee50e61518e42982a')

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
