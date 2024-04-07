## Maintainer: Sam Peters <dev at libertycloud dot de>
pkgname=fm-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal based file manager"
arch=('x86_64')
url="https://github.com/knipferrc/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('77325c9d6f9cb814c8fc1e15ea3b7d99e5922cce2d65c819b971b60870d558ff')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
