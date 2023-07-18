# Contributor: Paul Nicholson <brenix@gmail.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yor-bin
pkgver=0.1.183
pkgrel=1
pkgdesc="Extensible auto-tagger for your IaC files. The ultimate way to link entities in the cloud back to the codified resource which created it."
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url="https://www.yor.io/"
_githuburl="https://github.com/bridgecrewio/yor"
license=('Apache')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('glibc')
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_armv7h=('e0d4ec8f1c4916b6babbb4facdf5e7ded0b9000e643662378a824e648c5f9cb7')
sha256sums_aarch64=('7eaa3633ad131f2bd4d802a049c04ea068af1db8021061ff9f07ae54f7d42208')
sha256sums_i686=('2abcae9164a32bf22ef1cf5fe5efcd7af1f37f45e6ed828ac1649cffce6bae87')
sha256sums_x86_64=('2f3dd3582cde7cadeb747001eff9d3a5f32fc64f3a2776fd739448cdca2a6e7a')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}