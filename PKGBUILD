# Maintainer: omjadas <omjadas at gmail dot com>

pkgname=kube-score-bin
_realname="${pkgname%-bin}"
pkgver=1.20.0
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
sha256sums_x86_64=('ff777b4b3f45905b2d22c69e93c57a7a170e61529a79d54e59cb95cca4bc2a55')
sha256sums_aarch64=('0fafe8a00cbc98935f0c0953ba91e83e199f65e56d6816e7b2d2af5da1862051')
sha256sums_armv6h=('2a388d24d1316a81b91129094a589d8a1fcb339794f89247b4eb952a8d542559')

package() {
  cd "${srcdir}/"
  install -Dm755 "kube-score" "${pkgdir}/usr/bin/kube-score"
}
