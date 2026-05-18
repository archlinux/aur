pkgname=azsh-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight CLI tool to access Azure Cloud Shell directly from your terminal."
arch=('x86_64')
url="https://github.com/ayanrajpoot10/azsh"
license=('MIT')
provides=("azsh")
conflicts=("azsh")

source_x86_64=(
    "$url/releases/download/v$pkgver/azsh_Linux_x86_64.tar.gz"
)

sha256sums_x86_64=('e1a11ffbc1b63831a2742cc887e46b6caa311bf8fdbd0c2186c4be4e585d5eeb')

package() {
    install -Dm755 "$srcdir/azsh" "$pkgdir/usr/bin/azsh"
}
