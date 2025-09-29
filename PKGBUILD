# Maintainer: Nicholas Jordan nicholas@cvusmo.dev
pkgname=blackbeard-gtk-themes
pkgver=1.0
pkgrel=2
pkgdesc="Blackbeard dark and light GTK themes for Arch Linux (GTK 2/3/4)"
arch=('any')
url="https://github.com/cvusmo/blackbeard-theme"
license=('custom:0BSD')
depends=('gtk2' 'gtk3' 'gtk4')
makedepends=('git')
source=("git+https://github.com/cvusmo/blackbeard-theme.git#tag=v${pkgver}"
        "LICENSE")
sha256sums=('e40e08f5afc02640523b33a1c3f3b614ae4bcaf5fd279993f943adfa9941ba45'
            'c5ac3815e09cd53dfc33d4d05b7c8eb7f735aae5dde53d056f05fc17d4efbb67')

package() {
    install -dm755 "${pkgdir}/usr/share/themes/"
    cp -a "${srcdir}/blackbeard-theme/blackbeard-dark" "${pkgdir}/usr/share/themes/"
    cp -a "${srcdir}/blackbeard-theme/blackbeard-light" "${pkgdir}/usr/share/themes/"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
