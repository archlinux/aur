# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=3.2.1
pkgrel=1
pkgdesc="Cross-platform JavaScript library designed to simplify the client-side scripting of HTML"
arch=('any')
url="http://jquery.com"
license=('MIT' 'GPL2')
source=("http://code.jquery.com/jquery-${pkgver}.min.js"
		"http://code.jquery.com/jquery-${pkgver}.min.map"
		"http://code.jquery.com/jquery-${pkgver}.slim.min.js"
		"http://code.jquery.com/jquery-${pkgver}.slim.js"
		"http://code.jquery.com/jquery-${pkgver}.slim.min.map")
sha256sums=('87083882cc6015984eb0411a99d3981817f5dc5c90ba24f0940420c5548d82de'
            'b024550e593343d10f9c7a7121f976dd8619a768c2d663fa29d68952de9a94bd'
            '9365920887b11b33a3dc4ba28a0f93951f200341263e3b9cefd384798e4be398'
            'b40f32d17aa2c27a7098e225dd218070597646fc478c0f2aa74fb5b821a64668'
            '15b8947a001bc43ce62c97d5fd7f53e17ca64dae25ca1cdd7eb148d2f34e2ee6')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/javascript/${pkgname}"
    install -m644 "jquery-${pkgver}.min.js" "${pkgdir}/usr/share/javascript/jquery/jquery.min.js"
    install -m644 "jquery-${pkgver}.min.map" "${pkgdir}/usr/share/javascript/jquery/jquery.min.map"
    install -m644 "jquery-${pkgver}.slim.min.js" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.min.js"
    install -m644 "jquery-${pkgver}.slim.js" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.js"
    install -m644 "jquery-${pkgver}.slim.min.map" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.min.map"
}
