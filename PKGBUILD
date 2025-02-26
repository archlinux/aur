# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=vr-lighthouse-bin
_pkgname=lighthouse
pkgver=1.3.0
pkgrel=1
pkgdesc="VR Lighthouse power state management in Rust"
arch=('x86_64')
url="https://github.com/ShayBox/$_pkgname"
license=('MIT')
source=("${url}/releases/download/${pkgver}/Linux-x86_64.zip")
sha512sums=("0c9bbc6072840a3688b0cc6042fc41d12cc7edfbc32ca7586cdbcd4c3beeb50b6dded3ea325fba8785efaddb6dbde58987b32ff8af8556a7c7ca5d74deac0193")

package() {
  install -Dm755 lighthouse "${pkgdir}/usr/bin/${_pkgname}"
}

