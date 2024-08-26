# Maintainer: Th30 <ras-theo at monemail dot com>
pkgname=fortune-mod-wisdom-fr
pkgver=1.4
pkgrel=1
pkgdesc="Fortune cookies: Wisdom quotes in French"
arch=('any')
url="https://github.com/Bundy01/fortune-mod-wisdom-fr"
license=('GPL3')
depends=('fortune-mod')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c467e0a08e1ab7da9e5b4629d1d8a1125dd63b4b5d4936dd13aad13a605ba00c')

package()
{
	cd "${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}/usr/share/fortune/wisdom-fr"
	install -m644 Asie{,.dat} "${pkgdir}/usr/share/fortune/wisdom-fr"
	install -m644 Occident{,.dat} "${pkgdir}/usr/share/fortune/wisdom-fr"
	install -m644 RastAfrica{,.dat} "${pkgdir}/usr/share/fortune/wisdom-fr"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
