# Maintainer: fenuks

_pkgname=powerline-go
_binary=${_pkgname}-linux-amd64
pkgname=${_pkgname}-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="A beautiful and useful low-latency prompt for your shell, written in go"
arch=("x86_64")
url="https://github.com/justjanne/powerline-go"
license=("GPL3")
depends=()
optdepends=("powerline-fonts: fonts with powerline symbols")
makedepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=$pkgname.install
source=("https://github.com/justjanne/${_pkgname}/releases/download/v${pkgver}/${_binary}")

sha256sums=('435691c2fdfd2c047568e1a1fc2fdb7491e267888446d9592f3b30403cb3d21e')

package() {
    install -Dm755 "${srcdir}/${_binary}" "${pkgdir}/usr/bin/${_pkgname}"
}
