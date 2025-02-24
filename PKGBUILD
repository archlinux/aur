pkgname=lfetch
pkgver=1.0
pkgrel=1
pkgdesc="A minimalist fetch script written in 96 lines of code"
arch=('any')
url="https://github.com/ColtNovak/lfetch"   
license=('MIT')
source=("lfetch")  
sha256sums=('SKIP')   
source=("git+https://github.com/ColtNovak/lfetch.git")
pkgver() {
    cd "$srcdir/lfetch"
    git describe --tags --always
}

package() {
install -Dm644 -t "$pkgdir/usr/share/lfetch/logos" "$srcdir/your-repo/logos/"*
install -Dm755 "$srcdir/lfetch" "$pkgdir/usr/bin/lfetch"
}
