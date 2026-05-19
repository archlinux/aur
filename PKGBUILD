pkgname=azsh-bin
pkgver=0.1.1
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

sha256sums_x86_64=('c8591b5d893873453f6f6ee5ce3be2b6211c893ea2c52c6b31408888e2f63107')

package() {
    install -Dm755 "$srcdir/azsh" "$pkgdir/usr/bin/azsh"
}
