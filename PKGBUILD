# Maintainer: Th30
pkgname=fortune-mod-wisdom-fr
pkgver=1.3
pkgrel=1
pkgdesc="Fortune cookies: Wisdom quotes in French"
arch=('any')
url="https://github.com/Bundy01/fortune-mod-wisdom-fr"
license=('GPL3')
depends=('fortune-mod')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b1671622cd2925b8da8bf4fb5f59080ce2e4bb29bb0d430c04d50ec718c1ad57')

package()
{
    cd "${pkgname}-${pkgver}"
    install -dm755 "${pkgdir}/usr/share/fortune/wisdom-fr"
    install -m644 Asie{,.dat} "${pkgdir}/usr/share/fortune/wisdom-fr"
    install -m644 Occident{,.dat} "${pkgdir}/usr/share/fortune/wisdom-fr"
    install -m644 RastAfrica{,.dat} "${pkgdir}/usr/share/fortune/wisdom-fr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
