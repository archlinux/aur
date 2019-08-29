# Maintainer: fenuks

_pkgname=powerline-go
_binary=${_pkgname}-linux-amd64
pkgname=${_pkgname}-bin
pkgver=1.13.0
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

sha256sums=('1a6bddf9e8354b6ec2263df8489b349ac11e73b97d095f8a163404f3ff115995')

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
