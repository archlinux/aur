# Contributor: Paul Nicholson <brenix@gmail.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yor-bin
pkgver=0.1.179
pkgrel=1
pkgdesc="Extensible auto-tagger for your IaC files. The ultimate way to link entities in the cloud back to the codified resource which created it."
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url="https://www.yor.io/"
_githuburl="https://github.com/bridgecrewio/yor"
license=('Apache')
depends=('glibc')
options=(!strip)
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_armv7h=('213de5807bfd66de6af37984ef88883579b693edaf9dfa53ed11e22c04fb7490')
sha256sums_aarch64=('ca211aa7afee95839221c1f287d5c98c1bbfbacf5774266d58ef964eed6d7996')
sha256sums_i686=('e14aa355988f215b92aacb6e853731cfc63738272c6e2cf218c68c8892a83445')
sha256sums_x86_64=('26209c7d0f4a0f8afc99dddad2d9c241f93525bfe4d1d472be9bb98ec847cef8')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}