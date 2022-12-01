# Maintainer: izmntuk
pkgname=ttf-i.bming
pkgdesc='An old-style CJK serif font.'
pkgver=3.5
pkgrel=1
url='http://founder.acgvlyric.org/iu/doku.php/造字:開源字型_i.明體'
arch=('any')
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install='INSTALL'
options=('!strip')
source=("https://github.com/chillenb/ttf-i.bming/releases/download/v3.5/I.BMing3.5.zip")

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/share/fonts/TTF" "${pkgdir}/usr/share/"{licenses,doc}"/${pkgname}"
	install -m644 I.BMing_{history,readme}.txt "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 IPA_Font_License_Agreement_v1.0.txt "${pkgdir}/usr/share/licenses/${pkgname}"
	install -pm644 "I.BMing-3.500.ttf" "${pkgdir}/usr/share/fonts/TTF"
}

sha512sums=('7a3aa034d67074bb2a9b8da7cbcef39f7de53cb71de4ef6a37499b67f498f669e750d4a1a616a903754bce9e95df2aa325e673dc26af7632524fd088b0c1858b')
