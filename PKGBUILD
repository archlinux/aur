# Maintainer: omjadas <omjadas at gmail dot com>

pkgname=kube-score-bin
_realname="${pkgname%-bin}"
pkgver=1.18.0
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
sha256sums_x86_64=('2f4c3a43045ac4006fa1adcf970660828d2df09c4e9165bafe27d36479fa355a')
sha256sums_aarch64=('461c1d0df8074c6dbeb26302c47d802a0a17fa25c04ced8e9b807c2d9fb0b03a')
sha256sums_armv6h=('bf1a15e0d27ed6ae4149a01b1222b63fd83587e4a4d727009f50f70295930959')

package() {
  cd "${srcdir}/"
  install -Dm755 "kube-score" "${pkgdir}/usr/bin/kube-score"
}
