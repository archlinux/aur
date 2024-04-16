# Maintainer: Nailington <nailington at mathstudy dot dev>

pkgname=fortune-mod-helluva
pkgver=1
pkgrel=4
pkgdesc="A collection of fortune cookies containing quotes from the cast of Helluva Boss"
arch=('any')
license=('unknown')
depends=('fortune-mod')

source=('beelzebub' 'blitz' 'loona' 'millie' 'moxxie')
sha256sums=('6c230b94449225e0aafc7fb5fffa8ee197922b40ea12b7f5f692e5de42caee13'
	'860286c39b361729d90243859808ab66dc6f86e5d77bf1253321bfb8014eef57'
	'defc6f68b0e9c730620dedb3d93d4acc23931daeb9b39723d247c65feb912b99'
	'c108db205a83a2ec5c06d0e75dd084f71a7b608b53b470dbb65d6efa337185e3'
	'1c33caccb110919382aa7909bd075002a0d8037c4478f9816bf0f7c4b41412c4')

build(){
	strfile ${srcdir}/beelzebub ${srcdir}/beelzebub.dat
        strfile ${srcdir}/blitz ${srcdir}/blitz.dat
        strfile ${srcdir}/loona ${srcdir}/loona.dat
        strfile ${srcdir}/millie ${srcdir}/millie.dat
        strfile ${srcdir}/moxxie ${srcdir}/moxxie.dat
}

package(){
	install -D -m644 ${srcdir}/beelzebub ${pkgdir}/usr/share/fortune/beelzebub
        install -D -m644 ${srcdir}/beelzebub.dat ${pkgdir}/usr/share/fortune/beelzebub.dat
        install -D -m644 ${srcdir}/blitz ${pkgdir}/usr/share/fortune/blitz
        install -D -m644 ${srcdir}/blitz.dat ${pkgdir}/usr/share/fortune/blitz.dat
        install -D -m644 ${srcdir}/loona ${pkgdir}/usr/share/fortune/loona
        install -D -m644 ${srcdir}/loona.dat ${pkgdir}/usr/share/fortune/loona.dat
        install -D -m644 ${srcdir}/millie ${pkgdir}/usr/share/fortune/millie
        install -D -m644 ${srcdir}/millie.dat ${pkgdir}/usr/share/fortune/millie.dat
        install -D -m644 ${srcdir}/moxxie ${pkgdir}/usr/share/fortune/moxxie
        install -D -m644 ${srcdir}/moxxie.dat ${pkgdir}/usr/share/fortune/moxxie.dat
}
