# Maintainer: Jimmy Bonney <jimmy at furtivebot dot com>
pkgname=scrollshot-bin
pkgver=0.1.1
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
sha256sums=('5508ab86c5d6f4fac8b80fd98839bc4d0f3df76802d89437abbcb70385f17b73')

package() {
    install -Dm755 "scrollshot" "${pkgdir}/usr/bin/scrollshot"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
