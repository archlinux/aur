# Maintainer: Aline Abler <alinea@riseup.net>

pkgname=ttf-metamorphous
pkgver=20170131
pkgrel=2
pkgdesc='Metamorphous Font'
url="http://sorkintype.com/fonts.html"
license=('custom:OFL')
arch=('any')
source=(${pkgname}-${pkgver}-${pkgrel}::"https://get.fontspace.co/download/family/4l0ex/fc167416dbc347bcb6e62d8288759f1a/metamorphous-font.zip"
        OFL.txt)

package() {
	cd "${srcdir}"
	install -dm755 "${pkgdir}"/usr/share/fonts/TTF
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF

	install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('069c583470f9fb8ca6ef64467da17d51'
         '6ed93967ff0dc6dd9c8d31c17f817a06')
