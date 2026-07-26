# Maintainer: Max Roder <maxroder@mailbox.org>

pkgname='pmwiki'
pkgver='2.7.3'
pkgrel='1'
pkgdesc='Wiki software based on PHP'
url='https://www.pmwiki.org'
arch=('any')
license=('GPL')
depends=('php')
install='pmwiki.install'
source=("https://www.pmwiki.org/pub/${pkgname}/${pkgname}-${pkgver}.tgz")
sha256sums=('e997dac6bd23aa6b01b7070c891d9b77b17496ab70ccada64842c442c9f962ad')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -dm 770 -g http ${pkgdir}/srv/http/${pkgname}/wiki.d
	cp -a * ${pkgdir}/srv/http/${pkgname}/
}

# vim:set ts=2 sw=2 et:
