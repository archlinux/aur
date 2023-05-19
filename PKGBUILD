# Contributor: Paul Nicholson <brenix@gmail.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yor-bin
pkgver=0.1.177
pkgrel=1
pkgdesc="Extensible auto-tagger for your IaC files. The ultimate way to link entities in the cloud back to the codified resource which created it."
arch=('x86_64')
url="https://www.yor.io/"
_githuburl="https://github.com/bridgecrewio/yor"
license=('Apache')
depends=('glibc')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('711de26a5bc12cccbf5645880b3d265eedc96286f364e48ea91b0b4b25903b7b')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}