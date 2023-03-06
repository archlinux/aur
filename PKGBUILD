pkgname=kya
pkgver=0.2.5
pkgrel=1
depends=('curl')
makedepends=('rust' 'cargo')
url="https://github.com/gert7/kya"
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
