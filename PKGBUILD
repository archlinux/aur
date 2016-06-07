# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=fluxbox-arc-dark
pkgver=1.0
pkgrel=1
pkgdesc="Fluxbox port of the popular GTK theme"
arch=('any')
url="https://github.com/son-link/fluxbox-arc-dark"
license=('gpl3')
depends=('fluxbox')
source=("https://github.com/son-link/fluxbox-arc-dark/archive/v${pkgver}.tar.gz")
md5sums=('37c28ecd80fdc339a12a44097d769a7e')
package (){
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/share/fluxbox/styles"
	cp -r Arc-Dark "${pkgdir}/usr/share/fluxbox/styles"
}
