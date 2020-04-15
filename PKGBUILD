pkgname=tiler-bin
pkgver=2020_04_15
pkgrel=1
pkgdesc="Window aligning utility, written in rust"
arch=('x86_64')
url="https://github.com/Wint3rmute/tiler"
license=('custom:WTFPL')
makedepends=('wget')

source=("https://github.com/Wint3rmute/tiler/releases/download/1.1/tiler")
sha1sums=('3366e6043af91dedfb0fdbe8c42b0242832526ea')

package() {
    cd "$srcdir"
    
    install -Dm 755 ./tiler -t "${pkgdir}/usr/bin"
}
