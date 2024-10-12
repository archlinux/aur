pkgname="carch"
pkgver="3.0.2"
pkgrel=1
pkgdesc="A script to automate Arch Linux setup"
arch=('x86_64')
url="https://harilvfs.github.io/carch/"
license=('MIT')
depends=('bash' 'libnewt')
source=(
    "https://github.com/harilvfs/carch/releases/download/v3.0.2/carch"
    "https://raw.githubusercontent.com/harilvfs/carch/refs/heads/main/carch.desktop"
)
sha256sums=('SKIP' 'SKIP')  

build() {
    :
}

package() {
    install -Dm755 "$srcdir/carch" "$pkgdir/usr/bin/carch-setup"

    install -Dm644 "$srcdir/carch.desktop" "$pkgdir/usr/share/applications/carch.desktop"
}


