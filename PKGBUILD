# Maintainer: FadeMind <fademind@gmail.com>

pkgname=krusader-l10n-frameworks
pkgver=15.08
pkgrel=1
pkgdesc="Language packs for krusader-frameworks"
arch=('any')
url="http://www.krusader.org/"
license=('GPL')
depends=('krusader-frameworks-git')
source=("krusader-l10n.tar.lzma::https://copy.com/qCzbGv8vHUn4EazE/krusader-l10n.tar.lzma?download=1")
sha256sums=('d745e75b1d6f5e23275a35ce5d14364d179b497f2e447f346a50804c6a55177f')

package() {
	install -dm755 ${pkgdir}/usr/share/locale/
	cd ${srcdir}
	cp -rf * ${pkgdir}/usr/share/locale/
	rm ${pkgdir}/usr/share/locale/krusader-l10n.tar.lzma
}
