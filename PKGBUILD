# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=3.1.1
pkgrel=2
pkgdesc="Cross-platform JavaScript library designed to simplify the client-side scripting of HTML"
arch=('any')
url="http://jquery.com"
license=('MIT' 'GPL2')
source=("http://code.jquery.com/jquery-${pkgver}.min.js"
		"http://code.jquery.com/jquery-${pkgver}.min.map"
		"http://code.jquery.com/jquery-${pkgver}.slim.min.js"
		"http://code.jquery.com/jquery-${pkgver}.slim.js"
		"http://code.jquery.com/jquery-${pkgver}.slim.min.map")
sha256sums=('85556761a8800d14ced8fcd41a6b8b26bf012d44a318866c0d81a62092efd9bf'
            '92c8f004506524e28105928dec82a27be7a52b0449d04f7a1b21950d45d86687'
            'fd222b36abfc87a406283b8da0b180e22adeb7e9327ac0a41c6cd5514574b217'
            'e62fe6437d3433befd3763950eb975ea56e88705cd51dccbfd1d9a5545f25d60'
            'ce0ebf52bc8e8a80edc48b52cd0c2988c87d8cf7ecfb5dabe111eb660e677597')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/javascript/${pkgname}"
    install -m644 "jquery-${pkgver}.min.js" "${pkgdir}/usr/share/javascript/jquery/jquery.min.js"
    install -m644 "jquery-${pkgver}.min.map" "${pkgdir}/usr/share/javascript/jquery/jquery.min.map"
    install -m644 "jquery-${pkgver}.slim.min.js" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.min.js"
    install -m644 "jquery-${pkgver}.slim.js" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.js"
    install -m644 "jquery-${pkgver}.slim.min.map" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.min.map"
}
