# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=3.7.1
pkgrel=1
pkgdesc="Cross-platform JavaScript library designed to simplify the client-side scripting of HTML"
arch=('any')
url="https://jquery.com"
license=('MIT')
source=("https://code.jquery.com/jquery-${pkgver}.js"
		"https://code.jquery.com/jquery-${pkgver}.min.js"
		"https://code.jquery.com/jquery-${pkgver}.min.map"
		"https://code.jquery.com/jquery-${pkgver}.slim.min.js"
		"https://code.jquery.com/jquery-${pkgver}.slim.js"
		"https://code.jquery.com/jquery-${pkgver}.slim.min.map"
		"jquery-${pkgver}-LICENSE::https://raw.githubusercontent.com/jquery/jquery/${pkgver}/LICENSE.txt")
sha256sums=('78a85aca2f0b110c29e0d2b137e09f0a1fb7a8e554b499f740d6744dc8962cfe'
            'fc9a93dd241f6b045cbff0481cf4e1901becd0e12fb45166a8f17f95823f0b1a'
            '5e7d6d9c28b7f21006535e8875eb47e9667852a14c4624eed301c6cea19ae62b'
            '9261efb3407e3a9096e4654750d8eff6b3a663422f48845c7fbcc65034c340cf'
            '520bef37cbc19203b496e3d2525dacf13225392611a061405f88e50889bd01d7'
            '01b7a723c83b8fd6c343dfb603585d40f99687f293d35a9c4b1fe67e83b2dd64'
            'd4db9ebe6f29f5168eac45ad713f055623ac5d0dcd5ba92da23d650ae012020d')

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/usr/share/javascript/${pkgname}"
    install -m644 "jquery-${pkgver}.js" "${pkgdir}/usr/share/javascript/jquery/jquery.js"
    install -m644 "jquery-${pkgver}.min.js" "${pkgdir}/usr/share/javascript/jquery/jquery.min.js"
    install -m644 "jquery-${pkgver}.min.map" "${pkgdir}/usr/share/javascript/jquery/jquery.min.map"
    install -m644 "jquery-${pkgver}.slim.min.js" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.min.js"
    install -m644 "jquery-${pkgver}.slim.js" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.js"
    install -m644 "jquery-${pkgver}.slim.min.map" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.min.map"
    install -Dm644 "jquery-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
