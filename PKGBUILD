# Maintainer: Sam Peters <dev at libertycloud dot de>
pkgname=fm-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="A terminal based file manager"
arch=('x86_64')
url="https://github.com/knipferrc/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('8e97f4cda0e90774a41222390cbccf61cae73b57dae8d72004c7038f76e164a4')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
