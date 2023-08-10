# Maintainer: Th30
pkgname=fortune-mod-wisdom-fr
pkgver=1.3
pkgrel=2
pkgdesc="Fortune cookies: Wisdom quotes in French"
arch=('any')
url="https://github.com/Bundy01/fortune-mod-wisdom-fr"
license=('GPL3')
depends=('fortune-mod')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('52730f5a18950a998b2a38d31f3d820aee360642fbc28af2102be1f18e254592')

package()
{
    cd "${pkgname}-${pkgver}"
    install -dm755 "${pkgdir}/usr/share/fortune/wisdom-fr"
    install -m644 Asie{,.dat} "${pkgdir}/usr/share/fortune/wisdom-fr"
    install -m644 Occident{,.dat} "${pkgdir}/usr/share/fortune/wisdom-fr"
    install -m644 RastAfrica{,.dat} "${pkgdir}/usr/share/fortune/wisdom-fr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
