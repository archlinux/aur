# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=3.3.1
pkgrel=2
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
sha256sums=('160a426ff2894252cd7cebbdd6d6b7da8fcd319c65b70468f10b6690c45d02ef'
            '14a62d0001cecb74956ef6e883b6ff7b1ac1cf4883ec6b769555aa8f3fe34cb4'
            'dde76b9b2b90d30eb97fc81f06caa8c338c97b688cea7d2729c88f529f32fbb1'
            '7cd5c914895c6b4e4120ed98e73875c6b4a12b7304fbf9586748fe0a1c57d830'
            '4d1b350208787a6f321d3ed90e5b9fb2925efdcd4063e9ed4cdf761d809d315e'
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
