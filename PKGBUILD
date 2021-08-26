# Maintainer: afm0901x <tounghacker@gmail.com>

pkgname=playit-bin
_pkgname=playit
pkgver=0.4.6
pkgrel=1
pkgdesc="A tunneling tool so you can host a game server at home without port forwarding or sharing your public IP."
arch=("x86_64")
url="https://playit.gg"
license=("custom")
provides=("$_pkgname")
source=("${_pkgname}-${pkgver}::https://playit.gg/downloads/playit-linux_64-${pkgver}")
sha256sums=("adb5eb694f278309d9dd082e7f753e48e2386ef6463c25765d5bf9ff64961ccb")

package() {
	chmod +x "$srcdir/${_pkgname}-${pkgver}"
	install -Dm755 "$srcdir/${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
