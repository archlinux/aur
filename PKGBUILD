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
sha256sums=('c3f8cfdf54303bc77b5ce0ca6c046c9ff22e850990a898646b34ff1e09326621' '2171e7dc0300fced083f4b74548253fe0ff8b40b34ad0446d2c3557245735acc')  

build() {
    
    :
}

package() {
    
    install -Dm755 "$srcdir/carch" "$pkgdir/usr/bin/carch"
  
    install -Dm644 "$srcdir/carch.desktop" "$pkgdir/usr/share/applications/carch.desktop"
}


