# Maintainer: fasterinnerlooper <shafiq.jetha@outlook.com>
pkgname=mdterm
pkgver=1.2.11
pkgrel=1
pkgdesc="Render Markdown files beautifully in the terminal"
arch=('x86_64')
url="https://github.com/fasterinnerlooper/mdterm"
license=('MIT')
depends=('glibc')
source=("https://github.com/fasterinnerlooper/mdterm/releases/download/v1.2.11/mdterm-linux-x64.tar.gz")
sha256sums=('e0e41054c5d0415c84eafae5a3c6b3f926d55c4d16f64311fe95e7a1dcb5855f')

package() {
    install -Dm755 "$srcdir/mdterm-linux-x64/mdterm" "$pkgdir/usr/bin/mdterm"
}
