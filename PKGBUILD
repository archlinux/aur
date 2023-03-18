# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='ttf-istok'
pkgver='1.0.3'
pkgrel='1'
arch=('any')
license=('GPL3')
description='Hinted sans-serif typeface intended for LCD displays'
url='https://code.google.com/archive/p/istok/'
source=("https://downloads.sourceforge.net/project/istok/istok-ttf-${pkgver}.tar.xz")
b2sums=('5f16fbf4af1dade8df3a7ece91f8393f19be03b45fce1dc059cf15cb4f02ee6bf45fc5a25423a1ec3119c6f8875d04e9f4c3b34adbbb95028cca9a01b8d2d86b')
conflicts=('ttf-istok-ibx')
provides=('ttf-istok-ibx')

package () {
	install -m755 -d "${pkgdir}/usr/share/fonts/ttf-istok/"
	install -m644 -t "${pkgdir}/usr/share/fonts/ttf-istok/" "${srcdir}/istok-${pkgver}"/*.ttf
}
