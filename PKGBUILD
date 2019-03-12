# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=swaylock-blur-bin
_pkgname=${pkgname%-bin}
pkgver=0.3.0
pkgrel=1
pkgdesc="A small Rust program that runs swaylock and sets the image to a blurred screenshot of the desktop"
arch=("x86_64")
url="https://github.com/cjbassi/${_pkgname}"
license=("MIT")
depends=("swaylock" "ffmpeg" "grim" "sway")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("92d9a83275d7074e93521d786fc4e024c64e6f6437dbf1fd5fe2e6a28e83ca9a")

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
