# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=swaylock-blur-bin
_pkgname=${pkgname%-bin}
pkgver=0.3.1
pkgrel=1
pkgdesc="A small Rust program that runs swaylock and sets the image to a blurred screenshot of the desktop"
arch=("x86_64")
url="https://github.com/cjbassi/${_pkgname}"
license=("MIT")
depends=("swaylock" "ffmpeg" "grim" "sway")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("7c36d91d2f5a050e8b37f047304280d14c3c0c0c49455e08568bd2ee10bd8ff4")

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
