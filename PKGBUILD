# Maintainer: Funami
pkgname=fend-bin
pkgver=1.2.1
pkgrel=2
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/printfn/fend"
license=('MIT')
provides=('fend')
conflicts=('fend')
source=("https://raw.githubusercontent.com/printfn/fend/v$pkgver/LICENSE.md"
        "https://github.com/printfn/fend/releases/download/v$pkgver/fend.1")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-x64.zip")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-armv7-gnueabihf.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-aarch64-gnu.zip")
sha256sums=('a59abf360ab4ce1ce88d0c73f872313da3e6c5894799357a8423d6b68d966c43'
            '11b921e5976ac2f994a9b0105f0bb2c3b49499a17906694762ec6774199f4145')
sha256sums_x86_64=('05d38fbf13bc50bbd74739a6adc2cddcb913930e7287178f65124c593f1578c2')
sha256sums_armv7h=('32f4913843f6c1db66f627ce42b0158cb7faca32d8e1fcfae22cf1e68dd6c6df')
sha256sums_aarch64=('2cf4f47601ec35af0075248237ce7a33b944115829397cdf88905f5384f9c67b')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/fend/LICENSE"
  install -Dm644 fend.1 -t "$pkgdir/usr/share/man/man1"
}
