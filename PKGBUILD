# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=kube-prompt
pkgver=1.0.6
pkgrel=1
license=('MIT')
pkgdesc='An interactive kubernetes client featuring auto-complete using go-prompt'
arch=("i686" "x86_64")
url='https://github.com/c-bata/kube-prompt'
source_i686=("$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_linux_386.zip")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_linux_amd64.zip")
sha256sums_i686=('98eae226c2afca4e80405295936b888efd41638941d180e45aabaa115afd4589')
sha256sums_x86_64=('ea8301a31ef8362be15f5bd89b388e192b17645ca6cb5be37b0ddf974277c501')
provides=("$pkgname")

package() {
  install -Dm755 "./${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
