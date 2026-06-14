pkgname=azsh-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A CLI client for Azure Cloud Shell"
arch=('x86_64')
url="https://github.com/ayanrajpoot10/azsh"
license=('MIT')
provides=("azsh")
conflicts=("azsh")

source_x86_64=(
    "$url/releases/download/v$pkgver/azsh_Linux_x86_64.tar.gz"
)

sha256sums_x86_64=('98d7b19e772b17cceb7a1604274b122c838b688e4138a9ecb3eab4ca95af9aa3')

package() {
    install -Dm755 "$srcdir/azsh" "$pkgdir/usr/bin/azsh"
}
