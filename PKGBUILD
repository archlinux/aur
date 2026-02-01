# Maintainer: LY <ly-niko@qq.com>

_pkgname=hpcgame
pkgname=hpcgame-kube-cli-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="HPCGame Kube CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/hpcgame/hpcgame-kube-cli"
license=('MIT')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz")

sha256sums_x86_64=('a5cb6afed6cb8f6d28a33a5eeaaf24273fdb7de205a1a4122ab55cfe9d19b76c')
sha256sums_aarch64=('560818ae1a78f0c03c8ce993dd881a08f6a24073885a57d492e2cabafe3f05ef')

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
