# Maintainer: Funami
pkgname=fend-bin
pkgver=1.2.2
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
            '11b921e5976ac2f994a9b0105f0bb2c3b49499a17906694762ec6774199f4145')
sha256sums_x86_64=('24af70a5cdbdfafdc4db2612ee02d2ca515d28e3160a8dda3833f3fa584c44b2')
sha256sums_armv7h=('06240c45e436485efb78817284d7532e261cf065d05bdb526cae1fd870c66e1c')
sha256sums_aarch64=('f1aa0799bdbbd5ef8264e2b788b3f680e2257fcefbb4ba84fde9f3de2a8eb1f2')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/fend/LICENSE"
  install -Dm644 fend.1 -t "$pkgdir/usr/share/man/man1"
}
