# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=3.0.0
pkgrel=1
pkgdesc="Cross-platform JavaScript library designed to simplify the client-side scripting of HTML"
arch=('any')
url="http://jquery.com"
license=('MIT' 'GPL2')
source=("http://code.jquery.com/jquery-${pkgver}.min.js")
sha256sums=('266bcea0bb58b26aa5b16c5aee60d22ccc1ae9d67daeb21db6bad56119c3447d')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    install -m644 "jquery-${pkgver}.min.js" "${pkgdir}/usr/share/jquery/jquery.min.js"
}
