# Maintainer: Max Roder <maxroder@mailbox.org>

pkgname='pmwiki'
pkgver='2.3.3'
pkgrel='1'
pkgdesc='Wiki software based on PHP'
url='http://www.pmwiki.org'
arch=('any')
license=('GPL')
depends=('php')
install='pmwiki.install'
source=("http://www.pmwiki.org/pub/${pkgname}/${pkgname}-${pkgver}.tgz")
sha256sums=('8e9d96bee6a8d0106dc1b9b0979da1de82be38e5e7e12d25edd9fb80a40a089d')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -dm 770 -g http ${pkgdir}/srv/http/${pkgname}/wiki.d
	cp -a * ${pkgdir}/srv/http/${pkgname}/
}

# vim:set ts=2 sw=2 et:
