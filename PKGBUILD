# Maintainer: Th30
pkgname=fortune-mod-wisdom-fr
pkgver=1.2
pkgrel=1
pkgdesc="Fortune cookies: Wisdom quotes in French"
arch=('any')
url="https://github.com/Bundy01/fortune-mod-wisdom-fr"
license=('GPL3')
depends=('fortune-mod')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a2e1fcf8e76df66cafd3fc0e7fb6a2622b395921058ccc468ff6c45e4aec9f00')

package()
{
    cd "${pkgname}-${pkgver}"
    install -dm755 "${pkgdir}/usr/share/fortune/wisdom-fr"
    install -m644 Asie{,.dat} "${pkgdir}/usr/share/fortune/wisdom-fr"
    install -m644 Occident{,.dat} "${pkgdir}/usr/share/fortune/wisdom-fr"
    install -m644 RastAfrica{,.dat} "${pkgdir}/usr/share/fortune/wisdom-fr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
