# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-styles-mint-x
pkgver=20160816
pkgrel=1
pkgdesc="Fluxbox styles for gtk themes aur/mint-themes and aur/mint-x-icons"
arch=('any')
url="https://github.com/corebob/fluxbox-styles-corebob"
license=('GPL3')
depends=('')
source=('https://github.com/corebob/fluxbox-styles-corebob/releases/download/v1.1/mint-x.zip')
md5sums=('1a0b673e0b9a0dc131f1d197269d862a')

package() {
	mkdir -p "${pkgdir}/usr/share/fluxbox/styles"
	cp -dr --no-preserve=ownership "${srcdir}/mint-x" "${pkgdir}/usr/share/fluxbox/styles/"
	cp -dr --no-preserve=ownership "${srcdir}/mint-x-aqua" "${pkgdir}/usr/share/fluxbox/styles/"
	cp -dr --no-preserve=ownership "${srcdir}/mint-x-blue" "${pkgdir}/usr/share/fluxbox/styles/"
	cp -dr --no-preserve=ownership "${srcdir}/mint-x-brown" "${pkgdir}/usr/share/fluxbox/styles/"
	cp -dr --no-preserve=ownership "${srcdir}/mint-x-gray" "${pkgdir}/usr/share/fluxbox/styles/"
	cp -dr --no-preserve=ownership "${srcdir}/mint-x-orange" "${pkgdir}/usr/share/fluxbox/styles/"
	cp -dr --no-preserve=ownership "${srcdir}/mint-x-pink" "${pkgdir}/usr/share/fluxbox/styles/"
	cp -dr --no-preserve=ownership "${srcdir}/mint-x-purple" "${pkgdir}/usr/share/fluxbox/styles/"
	cp -dr --no-preserve=ownership "${srcdir}/mint-x-red" "${pkgdir}/usr/share/fluxbox/styles/"
	cp -dr --no-preserve=ownership "${srcdir}/mint-x-sand" "${pkgdir}/usr/share/fluxbox/styles/"
	cp -dr --no-preserve=ownership "${srcdir}/mint-x-teal" "${pkgdir}/usr/share/fluxbox/styles/"
}

