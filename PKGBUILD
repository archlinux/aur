# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=kube-prompt
pkgver=1.0.5
pkgrel=1
license=('MIT')
pkgdesc='An interactive kubernetes client featuring auto-complete using go-prompt'
arch=("i686" "x86_64")
url='https://github.com/c-bata/kube-prompt'
source_i686=("$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_linux_386.zip")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_linux_amd64.zip")
sha256sums_i686=('aeacb15f27bd8642b4a25a0c768ea443eabb74f9a0d0e9f9f5ab76ed6876ccfb')
sha256sums_x86_64=('f9b71471a830925844a4b30273e1b6736762d267ce5906974f33630803bb6a02')
provides=("$pkgname")

package() {
  install -Dm755 "./${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
