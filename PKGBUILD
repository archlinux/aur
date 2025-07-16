pkgname=digi-ttf
pkgver=1.0
pkgrel=1
pkgdesc="lowercase only pixel font"
arch=('any')
license=('GPL3')
url="https://github.com/danapixels/digi-ttf.git"
depends=()
source=("digi.ttf" "https://www.gnu.org/licenses/gpl-3.0.txt")
sha256sums=('f2480ef63fa940b5f72ef2edf7f27a572567c687edd1299e0d76eb286c039b7b' '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
noextract=("digi.ttf")
package() {
  install -Dm644 "$srcdir/digi.ttf" "$pkgdir/usr/share/fonts/TTF/digi.ttf"
  install -Dm644 "$srcdir/gpl-3.0.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
