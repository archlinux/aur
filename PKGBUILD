# Maintainer: afm0901x <tounghacker@gmail.com>

_pkgname="playit"
pkgname="${_pkgname}-bin"
pkgver=0.4.7
pkgrel=1
pkgdesc="A tunneling tool so you can host a game server at home without port forwarding or sharing your public IP."
arch=("x86_64")
url="https://playit.gg"
license=("custom")
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}::https://playit.gg/downloads/playit-linux_64-${pkgver}")
sha256sums=("SKIP")

package() {
	install -Dm755 ${srcdir}/${_pkgname}-${pkgver} ${pkgdir}/usr/bin/${_pkgname}
}

