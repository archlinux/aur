# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=vr-lighthouse-bin
_pkgname=lighthouse
pkgver=1.5.0
pkgrel=1
pkgdesc="VR Lighthouse power state management in Rust"
arch=('x86_64')
url="https://github.com/ShayBox/$_pkgname"
license=('MIT')
source=("${url}/releases/download/${pkgver}/Linux-x86_64.zip")
sha512sums=("97471f82b7ede743547a3248b6b8a3053196a161a5e4bb8a31108c6c37d5153ac3f5cfcfd5d225068d6f6404aac4a8266906fc1f9ae2319139480748ddb571e3")

package() {
  install -Dm755 lighthouse "${pkgdir}/usr/bin/${_pkgname}"
}

