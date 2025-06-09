pkgname=catbox-bin
pkgver=0.9.2
pkgrel=1
pkgdesc='Rust wrapper for the Catbox.moe API'
url='https://github.com/APT37/catbox'
arch=('x86_64')
license=('MIT-0')
source=("catbox::$url/releases/download/$pkgver/catbox")
sha256sums=('SKIP')
options=('!lto')
provides=('catbox')
conflicts=('catbox' 'catbox-git' 'catbox-bash')

package() {
    install -Dm755 'catbox' -t "$pkgdir/usr/bin"
}
