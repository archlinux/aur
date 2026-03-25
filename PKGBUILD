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
sha256sums=('1631bca74acc967e224f3edda7eb75f4ad02f1a5e8e055bd6f3d73978d7fbe9b')

package() {
    install -Dm755 "scrollshot" "${pkgdir}/usr/bin/scrollshot"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
