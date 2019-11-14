# Maintainer: James Pike <jpike@chilon.net>
pkgname=naru
pkgver=0.2.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')

build() {
    return 0
}

package() {
    cargo install --root="$pkgdir" naru
    mkdir "$pkgdir/usr"
    mv "$pkgdir/bin" "$pkgdir/usr"
    rm "$pkgdir/.crates.toml"
}
