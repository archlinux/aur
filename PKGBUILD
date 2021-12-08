# Maintainer: Ellie Huxtable <e@elm.sh>
pkgname=atuin
pkgver=0.7.2
pkgrel=1
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="atuin - magical shell history"
url="https://github.com/ellie/atuin"
license=('MIT')

build() {
    return 0
}

package() {
	cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --version $pkgver atuin
}
