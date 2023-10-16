# Maintainer: Funami
pkgname=fend-bin
pkgver=1.3.0
pkgrel=1
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
            '160310c64fa39ed677d22e905b6f6358dff2526e2f60dad6821be6517512d35f')
sha256sums_x86_64=('03defec3afd4058c97aedebe33269dfeb54fed396f20aa3bb4d3c03a9c5c8e90')
sha256sums_armv7h=('0c728d20d1045700f20af10664b691237ca05627001ba11fa9f211ec3a29f2d6')
sha256sums_aarch64=('2ea6a7b25456ef8f854c4b0d0015cf4e61e9f1d01c0c53dd6c32ce3514abfc93')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/fend/LICENSE"
  install -Dm644 fend.1 -t "$pkgdir/usr/share/man/man1"
}
