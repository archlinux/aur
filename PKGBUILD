# Maintainer: Jimmy Bonney <jimmy at furtivebot dot com>
pkgname=scrollshot-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Wayland scrolling screenshot tool for wlroots-based compositors"
arch=('x86_64')
url="https://github.com/jbonney/scrollshot"
license=('MIT')
depends=('wayland')
provides=('scrollshot')
conflicts=('scrollshot' 'scrollshot-git')
source=("${url}/releases/download/v${pkgver}/scrollshot-v${pkgver}-x86_64-linux.tar.gz")
sha256sums=('de2d243204e8c11f571ab16c96c0ce74793089cbcc8553a2d26d72f95f489394')

package() {
    install -Dm755 "scrollshot" "${pkgdir}/usr/bin/scrollshot"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
