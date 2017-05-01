# Maintainer: Lorenzo Giuliani <lorenzo at giuliani dot me>

pkgname=postage-bin
pkgver=3.2.9
pkgrel=1
pkgdesc="Postage - A fast replacement for PGAdmin"
arch=('i686' 'x86_64')
url="https://www.workflowproducts.com/postage.html"
license=('APL')
makedepends=('')
source_i686=("${pkgname}-${pkgver}-${CARCH}.rpm::https://github.com/workflowproducts/postage/releases/download/eV3.2.9/Postage-3.2.9-ia32.rpm")
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.rpm::https://github.com/workflowproducts/postage/releases/download/eV3.2.9/Postage-3.2.9.rpm")
sha256sums_i686=('20e62bc7e7eed0653cb662cf9726c73c054743b3c8a8a70fed52e93ceddaacf0')
sha256sums_x86_64=('ec5d2123d1d8459e20d20f1a797ecc7f3372d3a892db4f40ff6a15bacecb60f1')

package() {
	install -d "${pkgdir}"/opt/Postage
	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/share/share/icons
	cp --preserve=mode -r "${srcdir}"/opt/Postage/* "${pkgdir}"/opt/Postage
	cp --preserve=mode -r "${srcdir}"/usr/share/applications/* "${pkgdir}"/usr/share/applications
	cp --preserve=mode -r "${srcdir}"/usr/share/icons/* "${pkgdir}"/usr/share/icons
}
