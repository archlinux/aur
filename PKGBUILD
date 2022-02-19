# Maintainer: omjadas <omjadas at gmail dot com>

pkgname=kube-score-bin
_realname="${pkgname%-bin}"
pkgver=1.14.0
pkgrel=1
pkgdesc="Kubernetes object analysis with recommendations for improved reliability and security"
arch=("x86_64" "aarch64" "armv6h")
url="https://github.com/zegl/${_realname}"
license=("MIT")
provides=("kube-score")
conflicts=("${_realname}")
source_x86_64=("https://github.com/zegl/${_realname}/releases/download/v${pkgver}/kube-score_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/zegl/${_realname}/releases/download/v${pkgver}/kube-score_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("https://github.com/zegl/${_realname}/releases/download/v${pkgver}/kube-score_${pkgver}_linux_armv6.tar.gz")
sha256sums_x86_64=('8d1cc26fbc4fd2f2c0ae00e843ef8638fb5c477c63bda591cc3e1e61c485a173')
sha256sums_aarch64=('f76bd3fdb8ead9561e5ebbb9d930d7f7be2505f3b24127f90fb8948a5992c8c1')
sha256sums_armv6h=('5942731460067669cd2a7b7f0f6f9832b1b2e71ba72fcaa33b377a50029d934b')

package() {
  cd "${srcdir}/"
  install -Dm755 "kube-score" "${pkgdir}/usr/bin/kube-score"
}
