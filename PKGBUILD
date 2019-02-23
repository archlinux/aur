# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=swaylock-blur-bin
_pkgname=${pkgname%-bin}
pkgver=0.2.1
pkgrel=1
pkgdesc="A small Rust program that runs swaylock and sets the image to a blurred screenshot of the desktop"
arch=("x86_64")
url="https://github.com/cjbassi/gotop"
license=("MIT")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://github.com/cjbassi/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("a31b566ad07ef4728b2a2d5f8f1a66a7f907a6791496ac17249a32d72fa34411")

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
