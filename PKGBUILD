# Maintainer: Funami
pkgname=fend-bin
pkgver=1.4.2
pkgrel=1
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
sha256sums=('160310c64fa39ed677d22e905b6f6358dff2526e2f60dad6821be6517512d35f')
sha256sums_x86_64=('28fed4a54b6f87899ee84dca6e8d22539d87f43a47d9acba079cc57161e28e08')
sha256sums_armv7h=('e7a5b449a5f246249cb3adb24cad6b5098306bd5178adda3965e1f4ead6e2c8e')
sha256sums_aarch64=('08e4d94867eac7eed368d72a0317910992c9b14c1f01977dc3e0df30dd0a5dbf')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 fend.1 -t "$pkgdir/usr/share/man/man1"
}
