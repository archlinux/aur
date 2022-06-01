# Maintainer: Funami
pkgname=fend-bin
pkgver=1.0.2
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
sha256sums_x86_64=('a4682099092acd700f9edfd2e0e985aef16653a11106df6c205701c4d631132f')
sha256sums_armv7h=('223fabb046696ba0ea848578bd8b70278f49642288c53695597c547dba14582a')
sha256sums_aarch64=('779ee9400eec3276130047be06ccf2aa167e702ac52ddcfdafc668933c6f825e')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/fend/LICENSE"
}
