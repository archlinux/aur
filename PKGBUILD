# Maintainer Hari Chalise <ingoprivate@gmail.com>
pkgname="carch"
pkgver="v3.0.2"
pkgrel=1
pkgdesc="An automated script for quick & easy Arch Linux system setup"
arch=('x86_64')
url="https://harilvfs.github.io/carch/"
license=('Apache-2.0')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/harilvfs/$pkgname/archive/refs/tags/$pkgver.tar.gz"
    "https://github.com/harilvfs/carch/releases/download/v3.0.2/carch"
    "https://raw.githubusercontent.com/harilvfs/carch/refs/heads/main/carch.desktop"
)
sha256sums=('176f44570a7c60feed575ac2fe142a801168152d9d6c467e56aab21ff51f4882' 'da4ca1df39e9d27b006ddb06ee0ce78cf4c957cff05b2e59080144b612614fd7' '2171e7dc0300fced083f4b74548253fe0ff8b40b34ad0446d2c3557245735acc')  

build() {
    
    :
}

package() {
    
    tar -xzf "$srcdir/$pkgname-$pkgver.tar.gz" -C "$srcdir"

    install -Dm755 "$srcdir/carch" "$pkgdir/usr/bin/carch"
  
    install -Dm644 "$srcdir/carch.desktop" "$pkgdir/usr/share/applications/carch.desktop"
}


