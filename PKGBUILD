# Maintainer: Max Roder <maxroder@mailbox.org>

pkgname='pmwiki'
pkgver='2.7.4'
pkgrel='1'
pkgdesc='Wiki software based on PHP'
url='https://www.pmwiki.org'
arch=('any')
license=('GPL')
depends=('php')
install='pmwiki.install'
source=("https://www.pmwiki.org/pub/${pkgname}/${pkgname}-${pkgver}.tgz")
sha256sums=('a478ff61056b3c34f41281ff3dfc83821c19cb3fbc7d61a4a130c8ede3c3ae33')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -dm 770 -g http ${pkgdir}/srv/http/${pkgname}/wiki.d
	cp -a * ${pkgdir}/srv/http/${pkgname}/
}

# vim:set ts=2 sw=2 et:
