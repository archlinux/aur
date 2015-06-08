# Maintainer: Dea1993 <andrea.deangelis93@gmail.com>

pkgname=snake_pygame
pkgver=0.7.1
pkgrel=1
pkgdesc="A remake of classic Snake game written in Python"
arch=('any')
url="http://deasproject.altervista.org"
license=('GPL2')
depends=('python2-pygame' 'python2-numpy' 'python2-xdg')
source=("snake_${pkgver}.7z"::"http://sourceforge.net/projects/snakepygame/files/snake_${pkgver}.7z/download")
md5sums=('608cb6f9e925adbdbbae49d20ed660bd')

package() {
	cd "${srcdir}/snake_${pkgver}"

	install -m 755 -d "${pkgdir}/usr/share/${pkgname}"
	install -m 755 -t "${pkgdir}/usr/share/${pkgname}" "snake_pygame.py"

	install -m 755 -d "${pkgdir}/usr/share/${pkgname}/Sound"
	install -m 644 -t "${pkgdir}/usr/share/${pkgname}/Sound" Sound/*

	install -m 755 -d "${pkgdir}/usr/share/${pkgname}/Immagini"
	install -m 644 -t "${pkgdir}/usr/share/${pkgname}/Immagini" Immagini/*
	
	install -m 755 -d "${pkgdir}/usr/share/applications/"
	install -m 755 -t "${pkgdir}/usr/share/applications/" "snake_pygame.desktop"
	
	install -m 755 -d "${pkgdir}/usr/bin"
	install -m 755 -t "${pkgdir}/usr/bin/" "snake_pygame"
} 