# Maintainer: Funami
pkgname=fend-bin
pkgver=1.0.4
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
sha256sums=('9976b2d5c68966c9e5cec76ab25beb1a67eb271f8f58ef0534f441d6bd74470c')
sha256sums_x86_64=('434380ab2337a3bfa6e18d50e77336c7fbf18b91da22654d49610e2b63efbc6c')
sha256sums_armv7h=('64c283b2819968e2210406ac599785bb05d08453fb1d1ba46017be7747d47434')
sha256sums_aarch64=('579ba37ba319d6705a8aaa2c8af1ff7a2b4de1c3e01d67e4b602ed7dbe67b0bd')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/fend/LICENSE"
}
