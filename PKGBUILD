# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=vr-lighthouse-bin
_pkgname=lighthouse
pkgver=1.4.0
pkgrel=1
pkgdesc="VR Lighthouse power state management in Rust"
arch=('x86_64')
url="https://github.com/ShayBox/$_pkgname"
license=('MIT')
source=("${url}/releases/download/${pkgver}/Linux-x86_64.zip")
sha512sums=("c5fc416dcb56e10d81f68afe2bb07a7656ba9cc4f13a6c8ea0a6b00fdabdcfa38a46874f32e0cd15c49ec686599ccbed722c035b5c5e26b07d977012591ba9c2")

package() {
  install -Dm755 lighthouse "${pkgdir}/usr/bin/${_pkgname}"
}

