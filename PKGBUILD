# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=kube-prompt
pkgver=1.0.2
pkgrel=1
license=('MIT')
pkgdesc='An interactive kubernetes client featuring auto-complete using go-prompt'
arch=("i686" "x86_64")
url='https://github.com/c-bata/kube-prompt'
source_i686=("$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_linux_386.zip")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_linux_amd64.zip")
sha256sums_i686=('b2f698c6fe34335a436633ec44b3e85681cc376bfd13e7451d7d2a0be7d65207')
sha256sums_x86_64=('e05cc2f73f0332ab3d298521014b9f3d242627817f1a5540eeeda155b0a811e5')
provides=("$pkgname")

package() {
  install -Dm755 "./${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
