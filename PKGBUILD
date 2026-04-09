# Maintainer: Jedrzej Ratajczak <mrozelek@gmail.com>
pkgname=nilgreeter-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimal GTK4 greeter for greetd on Hyprland"
arch=('x86_64')
url="https://github.com/jedrzejratajczak/nil"
license=('MIT')
depends=('gtk4' 'greetd')
provides=('nilgreeter')
conflicts=('nilgreeter')
source=("${pkgname%-bin}-${pkgver}.tar.gz::https://github.com/jedrzejratajczak/nil/releases/download/v${pkgver}/nil-v${pkgver}-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "nilgreeter" "${pkgdir}/usr/bin/nilgreeter"
}
