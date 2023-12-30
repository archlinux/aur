# Maintainer: Funami
pkgname=fend-bin
pkgver=1.4.0
pkgrel=2
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/printfn/fend"
license=('GPL3')
provides=('fend')
conflicts=('fend')
source=("https://github.com/printfn/fend/releases/download/v$pkgver/fend.1")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-x64.zip")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-armv7-gnueabihf.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-aarch64-gnu.zip")
sha256sums=('b2a23e220473a9151f76bf18dc27c94ccc09afe4b7eacb49848d0a181bfdee38')
sha256sums_x86_64=('9b2db780866a2617f904fb47af3a927bb77833865dd32f520f2954eda0dcc77f')
sha256sums_armv7h=('49b5aa845fdd538f8d0b9c70e6b5370397b171250df0939ba3e9579f8b1c3a26')
sha256sums_aarch64=('4f711098c00055f7f87f22d145d77179875dfe60489b7c018f1bd05de9ee3bdb')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 fend.1 -t "$pkgdir/usr/share/man/man1"
}
