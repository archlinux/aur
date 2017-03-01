# Maintainer: Max Roder <maxroder@mailbox.org>

pkgname='pmwiki'
pkgver='2.2.95'
pkgrel='1'
pkgdesc='Wiki software based on PHP'
url='http://www.pmwiki.org'
arch=('any')
license=('GPL')
depends=('php')
install='pmwiki.install'
source=("http://www.pmwiki.org/pub/${pkgname}/${pkgname}-${pkgver}.tgz")
sha256sums=('019c37f5a36cd8c896ae6c14197331b4496880f3a1efdc3ac306fd78bbb9aa74')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -dm 770 -g http ${pkgdir}/srv/http/${pkgname}/wiki.d
	cp -a * ${pkgdir}/srv/http/${pkgname}/
}

# vim:set ts=2 sw=2 et:
