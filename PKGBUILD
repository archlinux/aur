# Maintainer: omjadas <omjadas at gmail dot com>

pkgname=kube-score-bin
_realname="${pkgname%-bin}"
pkgver=1.11.0
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
sha256sums_x86_64=('976d0deb493c86dfa43ab41a2ac8f755a3a500b70d9cce2e728bb7c2e8c370b5')
sha256sums_aarch64=('b25be63e9c5f86abbab380b24a7536817b1231727f44cb9aa81f272ca069131d')
sha256sums_armv6h=('f487da46892a9da715fc02bfc1fd0d5deee77a22ee5fca7cf5bc6054aebdb402')

package() {
  cd "${srcdir}/"
  install -Dm755 "kube-score" "${pkgdir}/usr/bin/kube-score"
}
