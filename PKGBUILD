# Maintainer: Funami
pkgname=fend-bin
pkgver=1.5.9
pkgrel=1
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64' 'aarch64')
url="https://github.com/printfn/fend"
license=('MIT')
provides=('fend')
conflicts=('fend')
source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/printfn/fend/v$pkgver/LICENSE.md"
        "$pkgname-$pkgver-fend.1::https://github.com/printfn/fend/releases/download/v$pkgver/fend.1")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-x86_64-gnu.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-aarch64-gnu.zip")
sha256sums=('d39a21ed70fb553856f6d7e74fee4332261069502ae32ab9ac13b49d147696f7'
            '913d927f91ba39dc415d8467c0a313a31dc9b0c278039eb7989abbe0956bc2e3')
sha256sums_x86_64=('6688224dc54dc8619742eef053e0764087194267714e78af7218c9a3682ad93a')
sha256sums_aarch64=('672ba294c8988698ffc7cc689e6f0a35a9b19a1b53aa166c8bde0c76242bac70')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/fend/LICENSE"
  install -Dm644 "$pkgname-$pkgver-fend.1" "$pkgdir/usr/share/man/man1/fend.1"
}
