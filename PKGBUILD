# Maintainer: Jimmy Bonney <jimmy at furtivebot dot com>
pkgname=scrollshot-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Wayland scrolling screenshot tool for wlroots-based compositors"
arch=('x86_64')
url="https://github.com/jbonney/scrollshot"
license=('MIT')
depends=('wayland')
provides=('scrollshot')
conflicts=('scrollshot' 'scrollshot-git')
options=(!debug)
source=("${url}/releases/download/v${pkgver}/scrollshot-v${pkgver}-x86_64-linux.tar.gz")
sha256sums=('6fe39b48119f20e36bd6fd81f8a416d47208e755f28e4c739e24c95353a3c6a9')

package() {
    install -Dm755 "scrollshot" "${pkgdir}/usr/bin/scrollshot"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
