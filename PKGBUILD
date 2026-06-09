pkgname=azsh-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Access Azure Cloud Shell directly from your terminal."
arch=('x86_64')
url="https://github.com/ayanrajpoot10/azsh"
license=('MIT')
provides=("azsh")
conflicts=("azsh")

source_x86_64=(
    "$url/releases/download/v$pkgver/azsh_Linux_x86_64.tar.gz"
)

sha256sums_x86_64=('82ababff1b2ae8e02027b6d667c25c7fa1f326e79e614855b893376366e5538d')

package() {
    install -Dm755 "$srcdir/azsh" "$pkgdir/usr/bin/azsh"
}
