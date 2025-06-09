pkgname=catbox-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Rust wrapper for the Catbox.moe API'
url='https://github.com/APT37/catbox'
arch=('x86_64')
license=('MIT-0')
source=("catbox::$url/releases/download/$pkgver/catbox")
sha256sums=('sha256:2bb56c414f03c01c8e1fddb944672543ba2952e160da0925c6fd46db83e81b85')
options=('!lto')
provides=('catbox')
conflicts=('catbox' 'catbox-git')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
