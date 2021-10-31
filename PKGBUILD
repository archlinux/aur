pkgname=kya
pkgver=0.1.7
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Watches for new screenshots and sends them to Gyazo"
license=('MIT')

build() {
    return 0
}

package() {
    cd $srcdir
    echo $pkgdir
    cargo install --root="$pkgdir/usr" --git=https://github.com/gert7/kya
    rm $pkgdir/usr/.crates.toml
    rm $pkgdir/usr/.crates2.json
}
