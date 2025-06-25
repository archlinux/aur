pkgname=catbox-bin
pkgver=0.9.2
pkgrel=4
pkgdesc='Rust wrapper for the Catbox.moe API'
url='https://github.com/APT37/catbox'
arch=('x86_64')
license=('MIT-0')
source=("catbox-$pkgver::$url/releases/download/$pkgver/catbox")
sha256sums=('fb12cec2a598998db5200dfc554c2ee43906f6479a5f5162c6a358682c27522a')
options=('!lto')
provides=('catbox')
conflicts=('catbox' 'catbox-git' 'catbox-bash')

package() {
    install -Dm755 "catbox-$pkgver" "$pkgdir/usr/bin/catbox"
}
