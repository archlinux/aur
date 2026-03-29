pkgname=wewa-bin
pkgver=0.3.0
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
sha256sums=('88a3cb98f80630f0684a4b7bd21ac2ae41a8a1f1ba7c798b908fc243226ded72')

package() {
  install -Dm755 "$srcdir/wewa" "$pkgdir/usr/bin/wewa"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
