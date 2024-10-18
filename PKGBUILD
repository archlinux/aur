# Maintainer Hari Chalise <ingoprivate@gmail.com>
pkgname="carch"
pkgver="v3.0.3"
pkgrel=1
pkgdesc="An automated script for quick & easy Arch Linux system setup"
arch=('x86_64')
url="https://harilvfs.github.io/carch/"
license=('Apache-2.0')
depends=('bash')
source=(
    "https://github.com/harilvfs/carch/releases/download/v3.0.3/carch"
    "https://raw.githubusercontent.com/harilvfs/carch/refs/heads/main/carch.desktop"
)
sha256sums=('edc67233e754359a69ee502712f46ff7e150d296ab52c54822b931ac81f39bc1' '2171e7dc0300fced083f4b74548253fe0ff8b40b34ad0446d2c3557245735acc')  

build() {
    
    :
}

package() {
    
    install -Dm755 "$srcdir/carch" "$pkgdir/usr/bin/carch"
  
    install -Dm644 "$srcdir/carch.desktop" "$pkgdir/usr/share/applications/carch.desktop"
}


