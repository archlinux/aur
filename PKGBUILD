# Maintainer: Prurigro
# Contributor: Lara Maia <lara@craft.net.br>

pkgname=weatherspect
pkgver=1.11
pkgrel=2
pkgdesc="A weather simulator using ASCII animations"
arch=('any')
url="http://robobunny.com/projects/weatherspect/html/"
license=('GPL')
depends=('perl-term-animation' 'perl-weather-underground')
source=("http://robobunny.com/projects/${pkgname}/${pkgname}_v${pkgver}.tar.gz" "${pkgname}.1")
sha512sums=('02bef58a31f7ca6e428d0efca7948160bc0a2283ea9329f433f2e3295f9e0190b0412e49632f1820fd744b68d5ab79bcbb04f5a914b023e3f94800fb4802362b' '0f3f75418bae698d788d6ef7db373a8fe03ab289752083068f549add4af71daf2fa414a5ee9d640d6f7546f61719221bf003402b3a3a68813e0fd3edfb09c9d5')

package() {
    install -Dm644 ${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    install -Dm755 ${pkgname}_v${pkgver}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
