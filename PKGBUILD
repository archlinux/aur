# Maintainer: fenuks

_pkgname=powerline-go
_binary=${_pkgname}-linux-amd64
pkgname=${_pkgname}-bin
pkgver=1.11.0
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
source=("${_pkgname}-${pkgver}::https://github.com/justjanne/${_pkgname}/releases/download/v${pkgver}/${_binary}")

sha256sums=('f00f2a20d56f79cb5747fb71d298f213f5c059d49a752606c8e464b792b419fa')

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
