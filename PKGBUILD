# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='ttf-istok'
pkgver='1.0.1'
pkgrel='1'
arch=('any')
license=('GPL3')
description='Hinted sans-serif typeface intended for LCD displays'
url='https://code.google.com/archive/p/istok/'
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/istok/istok-ttf-${pkgver}.tar.xz")
sha512sums=('8971a7e54affe64e4f093415120e2ef7b7b3ae38bd3a49b83d8241e2dc346b63e25de9565fc2e4ea7845dad24babceba9c43cd2f7cc9a8359fde80d43e29a713')
conflicts=('ttf-istok-ibx')
provides=('ttf-istok-ibx')

package () {
	install -m755 -d "${pkgdir}/usr/share/fonts/ttf-istok/"
	install -m644 -t "${pkgdir}/usr/share/fonts/ttf-istok/" "${srcdir}"/*.ttf
}
