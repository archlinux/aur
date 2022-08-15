# Maintainer: Sam Peters <dev at libertycloud dot de>
pkgname=fm-bin
pkgver=0.15.8
pkgrel=1
pkgdesc="A terminal based file manager"
arch=('x86_64')
url="https://github.com/knipferrc/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('76b79f8aefe8d369cb1a00fdc15c04216559b21ba19176cf37da0a036c84dd64')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
