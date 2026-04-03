# Maintainer: fasterinnerlooper <shafiq.jetha@outlook.com>
pkgname=mdterm
pkgver=1.1.5
pkgrel=1
pkgdesc="Render Markdown files beautifully in the terminal"
arch=('x86_64')
url="https://github.com/fasterinnerlooper/mdterm"
license=('MIT')
depends=('glibc')
source=("https://github.com/fasterinnerlooper/mdterm/releases/download/v${pkgver}/mdterm-linux-x64.tar.gz")
sha256sums=('3b6629e46dff3a37c80c2096c2014248984e6a0d2e4acaed8f06f52180b04011')

package() {
    install -Dm755 "$srcdir/mdterm-linux-x64/mdterm" "$pkgdir/usr/bin/mdterm"
}
