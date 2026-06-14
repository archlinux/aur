pkgname=azsh-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A CLI client for Azure Cloud Shell."
arch=('x86_64')
url="https://github.com/ayanrajpoot10/azsh"
license=('MIT')
provides=("azsh")
conflicts=("azsh")

source_x86_64=(
    "$url/releases/download/v$pkgver/azsh_Linux_x86_64.tar.gz"
)

sha256sums_x86_64=('ef4caecfc678101fec4a2dd33a6058c308a094fa128386426303f60d302a38fb')

package() {
    install -Dm755 "$srcdir/azsh" "$pkgdir/usr/bin/azsh"
}
