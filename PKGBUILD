pkgname=wewa-bin
pkgver=0.3.5
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
sha256sums=('c05441c057a606c9706980d35f1dfae23c10f8adcbff861b5787253305ad7c73')

package() {
  install -Dm755 "$srcdir/wewa" "$pkgdir/usr/bin/wewa"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
