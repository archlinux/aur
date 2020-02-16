# Maintainer: Andrej Radović (r.andrej@gmail.com)

pkgname=ttf-news-cycle
pkgver=0.5.2
pkgrel=2
depends=('fontconfig')
pkgdesc="A realist sans-serif typeface based on ATF's 1908 News Gothic."
url="https://www.glyphography.com/fonts/"
arch=('any')
license=('custom:OFL')
source=(https://launchpad.net/newscycle/trunk/${pkgver}/+download/newscycle-${pkgver}.zip)
sha1sums=('2e249f434e8192cbd859d7cfbc6985096ec22765')

package() {
    cd newscycle-${pkgver}
	install -m755 -d "${pkgdir}/usr/share/fonts/${pkgname}"
	install -m644 *.ttf "${pkgdir}/usr/share/fonts/${pkgname}"

	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
