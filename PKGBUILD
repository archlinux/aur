# Maintainer: Sam Peters <dev at libertycloud dot de>
pkgname=fm-bin
pkgver=0.15.2
pkgrel=1
pkgdesc="A terminal based file manager"
arch=('x86_64')
url="https://github.com/knipferrc/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('b8355f2dbd8fa3b02c29cec0743eb082b5c2ba32c2c73a05076d614e6b431f79')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
