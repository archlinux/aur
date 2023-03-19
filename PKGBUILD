# Maintainer: Yidaozhan Ya <yidaozhan_ya@outlook.com>

pkgname=hoyo-glyphs
pkgver=20230324
pkgrel=1
pkgdesc="Constructed scripts by HoYoverse 米哈游的架空文字 "
arch=("any")
license=("custom")
url="https://github.com/SpeedyOrc-C/Hoyo-Glyphs"
source=("git+${url}.git")
sha256sums=(SKIP)

package () {
	cd "${srcdir}/Hoyo-Glyphs"
	install -dm755 "${pkgdir}/usr/share/fonts/${pkgname}"
	cp -r font/* "${pkgdir}/usr/share/fonts/${pkgname}"

	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
