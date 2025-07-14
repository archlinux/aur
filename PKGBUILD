# Maintainer: Funami
pkgname=fend-bin
pkgver=1.5.7
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
            '7902e777734d3ebc9efe3111b2f19beef682e654c1049f6a03514506f4354642')
sha256sums_x86_64=('aa7991265821595800d32aff64be79e0810eb1b3d77a446a48172dfe536e2928')
sha256sums_aarch64=('ab35be2a4490034e4b2edea7f13fd5642e82a188487bf0e58b96db892dead2f7')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/fend/LICENSE"
  install -Dm644 "$pkgname-$pkgver-fend.1" "$pkgdir/usr/share/man/man1/fend.1"
}
