# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=kube-prompt
pkgver=1.0.1
pkgrel=1
license=('MIT')
pkgdesc='An interactive kubernetes client featuring auto-complete using go-prompt'
arch=("i686" "x86_64")
url='https://github.com/c-bata/kube-prompt'
source_i686=("$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_linux_386.zip")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_linux_amd64.zip")
sha256sums_i686=('9497496a5e1c058472ad61230eb5dc285034aa98b32f5c2542f53556d7f97c15')
sha256sums_x86_64=('9c5221696effafc7f0519511958ba1fa1c5d0c03708ce7413490fbe99a672fa5')
provides=("$pkgname")

package() {
  install -Dm755 "./${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
