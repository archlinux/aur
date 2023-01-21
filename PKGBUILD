# Maintainer: omjadas <omjadas at gmail dot com>

pkgname=kube-score-bin
_realname="${pkgname%-bin}"
pkgver=1.16.1
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
sha256sums_x86_64=('b57731b40df8f7aff3b45751f291274e80d853befeb9e6b693d1e84b28d3bc36')
sha256sums_aarch64=('3dcd9a6b883d0bd37d6234a92fd647efc5a2d78028fe8d07c0c89e4805cca870')
sha256sums_armv6h=('d012345acf615ff799964ea6db6193776a902ae54d48a5c4c37c7f47709997e0')

package() {
  cd "${srcdir}/"
  install -Dm755 "kube-score" "${pkgdir}/usr/bin/kube-score"
}
