# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=3.4.1
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
sha256sums=('0925e8ad7bd971391a8b1e98be8e87a6971919eb5b60c196485941c3c1df089a'
            '8da74aec0fcdd7678a2663b3cc9bafbaf009e6d6929b28bb3dd95bced18206f6'
            'a5ab2a00a0439854f8787a0dda775dea5377ef4905886505c938941d6854ee4f'
            '0539537503bdfdf6ac701d5dade92b0d591a29df4f93007298c9473a21bea8b2'
            '002d30ff1c54bd8474796dea3278b032a56ad7a77cef9b16c298e9bf5731fa6c'
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
