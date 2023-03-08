# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=3.6.4
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
		"LICENSE::https://raw.githubusercontent.com/jquery/jquery/${pkgver}/LICENSE.txt")
sha256sums=('6bd8c1051ca05f5061e65b7c1998d70f3c8e07e6d6bdef4488eeed44e52d8ff1'
            'a0fe8723dcf55da64d06b25446d0a8513e52527c45afcb37073465f9c6f352af'
            '25ff6edf2cfe002b64381b97b834b5c24d9392755e29f4fd39afe163d67a01d9'
            '6b6ca31cce239c5f5fe78c5441a9236466aa62cfd5d4262f5a9a2a6730b6fc1c'
            '756bd5f384fa061ccee2f1ba81686c595295a1ae255662e7a4139987f0801d4e'
            '9063a32c56c38e14bc21f37d162e69fcb60bea71d36fbf903e503b32ca963f55'
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
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
