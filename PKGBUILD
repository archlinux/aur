# Maintainer: LY <ly-niko@qq.com>

_pkgname=hpcgame
pkgname=hpcgame-kube-cli-bin
pkgver=0.5.6
pkgrel=1
pkgdesc="HPCGame Kube CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/hpcgame/hpcgame-kube-cli"
license=('MIT')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz")

sha256sums_x86_64=('e93684b858bcaff1c92a321e6d48d88461b75bc7862abf4b62aef87617f29e61')
sha256sums_aarch64=('a871352e8a62dd9ef9b1b2d27e45912ce40028d5cd6220b1687d2b7d35082f1f')

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
