# Maintainer: Funami
pkgname=fend-bin
pkgver=1.2.0
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
sha256sums_x86_64=('414d175bf989c12d010b7b42e1cfd06150067675713e99f1a90b7205e803ee5d')
sha256sums_armv7h=('e8722a9a431ac56dfa27885823608cb6c78b021ad32fa0f164935748e86cd8eb')
sha256sums_aarch64=('0e5e5557c3b6ff3cf3746d740889f1e4d59feb56b500b3d0401570db4801ec38')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/fend/LICENSE"
}
