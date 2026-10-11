pkgname=wewa-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Display web content as desktop wallpaper"
arch=('x86_64')
url="https://github.com/ownself/wewa"
license=('MIT')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'gtk-layer-shell'
)
provides=('wewa')
conflicts=('wewa')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/wewa-linux-x64.tar.gz")
sha256sums=('ff5821617254806729bf660e66acf0346e1e05c4472bad2cc77b6e67e2c0bf5c')

package() {
  install -Dm755 "$srcdir/wewa" "$pkgdir/usr/bin/wewa"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
