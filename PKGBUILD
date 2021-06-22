# Maintainer: Mark Stenglein <aur@markstenglein.com>

pkgname=slides-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Terminal based presentation tool'
arch=('x86_64')
url="https://github.com/maaslalani/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('45bf3ef71503dfc0aaf9398f422236a1011d4e60815e4165920a565cf3b2d094')
changelog='CHANGELOG.md'

package() {
    install -Dm755 ${pkgname%-bin} "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

