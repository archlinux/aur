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
options=(!debug)
source=("${url}/releases/download/v${pkgver}/scrollshot-v${pkgver}-x86_64-linux.tar.gz")
sha256sums=('a76a70453ec147d66532c36a2722568ef600fe2766df0ba705c5125174dc67a0')

package() {
    install -Dm755 "scrollshot" "${pkgdir}/usr/bin/scrollshot"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
