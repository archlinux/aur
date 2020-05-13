# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=3.5.1
pkgrel=1
pkgdesc="Cross-platform JavaScript library designed to simplify the client-side scripting of HTML"
arch=('any')
url="https://jquery.com"
license=('MIT')
source=("https://code.jquery.com/jquery-${pkgver}.min.js"
		"https://code.jquery.com/jquery-${pkgver}.min.map"
		"https://code.jquery.com/jquery-${pkgver}.slim.min.js"
		"https://code.jquery.com/jquery-${pkgver}.slim.js"
		"https://code.jquery.com/jquery-${pkgver}.slim.min.map"
		"LICENSE::https://raw.githubusercontent.com/jquery/jquery/${pkgver}/LICENSE.txt")
sha256sums=('f7f6a5894f1d19ddad6fa392b2ece2c5e578cbf7da4ea805b6885eb6985b6e3d'
            '511d6f6d3e7acec78cd2505f04282b6e01329b4c24931f39d91739d0d1ddeef8'
            'e3e5f35d586c0e6a9a9d7187687be087580c40a5f8d0e52f0c4053bbc25c98db'
            '0eb4f935fc5f6c7bcc1eec77d4b921c60e362d8ea87fc4da6322b9d239f14673'
            'e73955df90d9fee336f9bbf73d9b8c6fa3267ccb6eee3bfda7ee2edda51a4fe9'
            '1ff603118efdb313799567cb4a408594954384f40843ca6f29c596f5b1f8907d')

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/usr/share/javascript/${pkgname}"
    install -m644 "jquery-${pkgver}.min.js" "${pkgdir}/usr/share/javascript/jquery/jquery.min.js"
    install -m644 "jquery-${pkgver}.min.map" "${pkgdir}/usr/share/javascript/jquery/jquery.min.map"
    install -m644 "jquery-${pkgver}.slim.min.js" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.min.js"
    install -m644 "jquery-${pkgver}.slim.js" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.js"
    install -m644 "jquery-${pkgver}.slim.min.map" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.min.map"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
