# Maintainer: Hisbaan Noorani <hisbaan@gmail.com>
pkgname=didyoumean-bin
pkgver=1.1.2
pkgrel=1
epoch=
pkgdesc="A CLI spelling corrector"
arch=('x86_64')
url="https://github.com/hisbaan/didyoumean"
license=('GPL3')
depends=('gcc-libs')
optdepends=('libxcb: X11 clipboard support'
            'wl-clipboard: Wayland clipboard support')
provides=('didyoumean')
conflicts=('didyoumean')
source=("https://github.com/hisbaan/didyoumean/releases/download/v${pkgver}/dym-${pkgver}-x86_64.tar.gz")
sha256sums=("4c51cd1fcd5160a967c46007742a71aae9cc85dcdcf0c06e82711755f65d413e")

package() {
    cd "$srcdir/"

    install -Dm755 dym -t "${pkgdir}/usr/bin/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}/"
}
