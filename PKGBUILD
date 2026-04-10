# Maintainer: Jedrzej Ratajczak <mrozelek@gmail.com>
pkgname=nilnotify-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Lightweight GTK4 notification daemon for Hyprland"
arch=('x86_64')
url="https://github.com/jedrzejratajczak/nil"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
provides=('nilnotify')
conflicts=('nilnotify')
source=("${pkgname%-bin}-${pkgver}.tar.gz::https://github.com/jedrzejratajczak/nil/releases/download/v${pkgver}/nil-v${pkgver}-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "nilnotify" "${pkgdir}/usr/bin/nilnotify"
}
