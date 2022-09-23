# Maintainer: Funami
pkgname=fend-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/printfn/fend"
license=('MIT')
provides=('fend')
conflicts=('fend')
source=("https://raw.githubusercontent.com/printfn/fend/v$pkgver/LICENSE.md")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-x64.zip")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-armv7-gnueabihf.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-aarch64-gnu.zip")
sha256sums=('a59abf360ab4ce1ce88d0c73f872313da3e6c5894799357a8423d6b68d966c43')
sha256sums_x86_64=('8ddb9e550b5b943bf1e7c03d3c5bfe5e7e2ea3c1c10462c1abce88f036b97cba')
sha256sums_armv7h=('66da8e516aea5a1b270a9dc4c405ebb53335ff2b29b32ff0f11f40683e8b7317')
sha256sums_aarch64=('feb6fc5edbdff42ede6b1d9fef77ff35bf1e64cc8fee7287c29343bc32a7ca92')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/fend/LICENSE"
}
