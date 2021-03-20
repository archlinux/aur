# Maintainer: Ellie Huxtable <e@elm.sh>
pkgname=atuin
pkgver=0.4.0
pkgrel=1
makedepends=('rustup')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="atuin - magical shell history"
license=('MIT')

build() {
    return 0
}

package() {
	rustup default nightly
	cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --version $pkgver atuin
}
