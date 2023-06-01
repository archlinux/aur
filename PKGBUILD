# Maintainer: Th30
pkgname=fortune-mod-wisdom-fr
pkgver=1.1
pkgrel=2
pkgdesc="Fortune cookies: Wisdom quotes in French"
arch=('any')
url="https://github.com/Bundy01/fortune-mod-wisdom-fr"
license=('GPL3')
depends=('fortune-mod')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cb3a631f51dbe1ce5adc19179548fecdfe5aaf17ecf220750cacec6f831e5ef4')

package()
{
	cd "${pkgname}-${pkgver}"
	mkdir -pm755 "${pkgdir}/usr/share/fortune/wisdom-fr"
	install -Dm644 Asie{,.dat} "/usr/share/fortune/wisdom-fr"
	install -Dm644 Occident{,.dat} "/usr/share/fortune/wisdom-fr"
	install -Dm644 RastAfrica{,.dat} "/usr/share/fortune/wisdom-fr"
}
