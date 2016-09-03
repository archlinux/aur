# Maintainer: Max Roder <maxroder@mailbox.org>

pkgname='pmwiki'
pkgver='2.2.90'
pkgrel='1'
pkgdesc='Wiki software based on PHP'
url='http://www.pmwiki.org'
arch=('any')
license=('GPL')
depends=('php')
install='pmwiki.install'
source=("http://www.pmwiki.org/pub/${pkgname}/${pkgname}-${pkgver}.tgz")
sha256sums=('29c5f069c4c0617f6d9f1c9c7963e8eadfb5738d73c7e72add017ec74ebdd037')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -dm 770 -g http ${pkgdir}/srv/http/${pkgname}/wiki.d
	cp -a * ${pkgdir}/srv/http/${pkgname}/
}

# vim:set ts=2 sw=2 et:
