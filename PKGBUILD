# Maintainer: Hisbaan Noorani <hisbaan@gmail.com>
pkgname=didyoumean-bin
pkgver=1.1.1
pkgrel=1
epoch=
pkgdesc="A CLI spelling corrector"
arch=('x86_64')
url="https://github.com/hisbaan/didyoumean"
license=('GPL3')
depends=('gcc-libs')
optdepends=('libxcb: X11 clipboard support'
            'wayland: Wayland clipboard support')
provides=('didyoumean')
replaces=('didyoumean')
source=("https://github.com/hisbaan/didyoumean/releases/download/v${pkgver}/dym-${pkgver}-x86_64.tar.gz")
sha256sums=("c8e00a1ab51d952f317d093d187bce08dbde367ba588fd634e4f726da7484303")

package() {
    cd "$srcdir/"

    install -Dm755 dym -t "${pkgdir}/usr/bin/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}/"
}
