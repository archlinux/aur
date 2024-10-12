pkgname="carch"
pkgver="3.0.2" 
pkgrel=1
pkgdesc="A script to automate Arch Linux setup"
arch=('x86_64')
url="https://harilvfs.github.io/carch/"
license=('MIT')
depends=('bash' 'whiptail')
source=(
    "https://github.com/harilvfs/carch/releases/latest/download/carch"
    "https://raw.githubusercontent.com/harilvfs/carch/refs/heads/main/carch.desktop"
    )
sha256sums=('SKIP') 

build() {
    cd "$srcdir/$pkgname-$pkgver"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 setup.sh "$pkgdir/usr/bin/carch"
}

