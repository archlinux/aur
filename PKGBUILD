# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=3.5.0
pkgrel=1
pkgdesc="Cross-platform JavaScript library designed to simplify the client-side scripting of HTML"
arch=('any')
url="http://jquery.com"
license=('MIT')
source=("http://code.jquery.com/jquery-${pkgver}.min.js"
		"http://code.jquery.com/jquery-${pkgver}.min.map"
		"http://code.jquery.com/jquery-${pkgver}.slim.min.js"
		"http://code.jquery.com/jquery-${pkgver}.slim.js"
		"http://code.jquery.com/jquery-${pkgver}.slim.min.map"
		"LICENSE")
sha256sums=('c4dccdd9ae25b64078e0c73f273de94f8894d5c99e4741645ece29aeefc9c5a4'
            '3149351c8cbc3fb230bbf6188617c7ffda77d9e14333f4f5f0aa1aae379df892'
            '325bac0cb2483f519180bace7e5510b6c8723f44f04ff4475ec235c161a7421b'
            'b027b185a2a901fbaaba52a3b5263b57d1fb413d1308df741fe6393659aa3941'
            '0d55c2f39dd7a49ea54a76de9eb22382ff4962adc528e2aca9298443a1c47b4a'
            '2b3ed8ba424423a50b023e728530d94bc385cfc7c328ad65a3dfee9c7c0531c5')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/javascript/${pkgname}"
    install -m644 "jquery-${pkgver}.min.js" "${pkgdir}/usr/share/javascript/jquery/jquery.min.js"
    install -m644 "jquery-${pkgver}.min.map" "${pkgdir}/usr/share/javascript/jquery/jquery.min.map"
    install -m644 "jquery-${pkgver}.slim.min.js" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.min.js"
    install -m644 "jquery-${pkgver}.slim.js" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.js"
    install -m644 "jquery-${pkgver}.slim.min.map" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.min.map"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
