# Maintainer: Genevieve <genevieve on sunlashed point garden>
pkgname=paket-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A simple and fast package manager for the Fish shell written in Rust"
arch=('x86_64')
url="https://github.com/joseluisq/paket"
license=('MIT' 'APACHE')
depends=('git' 'fish')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/\
paket-v$pkgver-$arch-unknown-linux-gnu.tar.gz")
sha256sums=('3a7ee63724a6e84ecf2c9acadb24de842722b135fddaa9704ecf8cc987557093')

package() {
  cd "paket-v$pkgver-$arch-unknown-linux-gnu"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/paket/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/paket/LICENSE-APACHE"
  install -Dm755 paket "$pkgdir/usr/bin/paket"
}
