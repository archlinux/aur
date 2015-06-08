# Contributor: erm67
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=micropolis-java
_rpkgname=micropolisj
pkgver=1.6
pkgrel=1
pkgdesc="Micropolis Unix version [SimCity 1] rewrited in Java"
arch=("any")
url="https://github.com/SimHacker/micropolis"
license=("GPL3")
depends=("java-runtime>=7")
# Upstream in GitHub not have tarballs, and the repo is a mess, help?
source=("http://micropolis.googlecode.com/files/${_rpkgname}-${pkgver}.zip"
	"micropolis-java.sh"
	"micropolis-java.desktop")

package(){
	cd "${srcdir}"

	install -Dm677 "${srcdir}/${_rpkgname}.jar" \
		"${pkgdir}/usr/share/micropolis-java/${_rpkgname}.java"
	install -Dm677 "${srcdir}/COPYING" \
		"${pkgdir}/usr/share/doc/${pkgname}/COPYING"
	install -Dm677 "${srcdir}/README" \
		"${pkgdir}/usr/share/doc/${pkgname}/README"
	install -Dm677 "${srcdir}/${_rpkgname}-icon.png" \
		"${pkgdir}/usr/share/pixmaps/${_rpkgname}.png"
	install -Dm677 "${srcdir}/micropolis-java.sh" \
		"${pkgdir}/usr/bin/micropolis-java"
	install -Dm677 "${srcdir}/micropolis-java.desktop" \
		"${pkgdir}/usr/share/applications/micropolis-java.desktop"
}
	

md5sums=('814be8cc8be6e15c190b4023772540ae'
         '3a3175eff542ff8c08483e2b41b45529'
         '5d0667a3049111b4e7e9f07f1992bc01')
