pkgname=catbox-bin
pkgver=0.9.0
pkgrel=3
pkgdesc='Rust wrapper for the Catbox.moe API'
url='https://github.com/APT37/catbox'
arch=('x86_64')
license=('MIT-0')
source=("catbox::$url/releases/download/$pkgver/catbox")
sha256sums=('2bb56c414f03c01c8e1fddb944672543ba2952e160da0925c6fd46db83e81b85')
options=('!lto')
provides=('catbox')
conflicts=('catbox' 'catbox-git' 'catbox-bash')

package() {
    install -Dm755 'catbox' -t "$pkgdir/usr/bin"
}
