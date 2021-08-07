# Maintainer: afm0901x <tounghacker@gmail.com>

pkgname=playit-bin
_pkgname=playit
pkgver=0.4.4
pkgrel=1
pkgdesc="A tunneling tool so you can host a game server at home without port forwarding or sharing your public IP."
arch=("x86_64")
url="https://playit.gg"
license=("custom")
provides=("$_pkgname")
source=("${_pkgname}-${pkgver}::https://playit.gg/downloads/playit-linux_64-${pkgver}")
sha256sums=("eb1c0e7641d6e6ab772bd53f0227dc562a5f86a84aa91a752cd7e4077a12ea0d")

package() {
	chmod +x "$srcdir/${_pkgname}-${pkgver}"
	install -Dm755 "$srcdir/${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
