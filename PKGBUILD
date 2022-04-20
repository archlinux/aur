# Maintainer: Sam Peters <dev at libertycloud dot de>
pkgname=fm-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="A terminal based file manager"
arch=('x86_64')
url="https://github.com/knipferrc/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('3ec8d4ac26d4430b4421190613798b9d1299b83d577d98f01b1b591913480982')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
