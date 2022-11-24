# Maintainer: Porta <portalmaster137@gmail.com>
pkgname="not-helloworld"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="haha funny."
arch=('x86_64')
_archive_url="https://github.com/portalmaster137/not-helloworld/raw/master/not-helloworld.7z"
license=('MIT')
depends=('p7zip' 'gcc')
source=($_archive_url)
sha256sums=('22e0b32e0cb486bfe19fad28ff08b5fb3314c425da4fa22e7b0720052fb04167')

build() {
    cd "$srcdir"
    7z x -aoa not-helloworld.7z
    make
}
package(){
    cd "$srcdir"
    install -Dm755 not-helloworld "$pkgdir/usr/bin/not-helloworld"
}