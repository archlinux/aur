# Maintainer: Funami
pkgname=fend-bin
pkgver=1.3.1
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
sha256sums_x86_64=('b9e88b7541b94370202c9469baa23296f480517a7a5903950564f24be96d07fc')
sha256sums_armv7h=('9dbaaac36f69ccf3258fe8a817c0e50329b1a5ce0adfb75158b56d12e63030e9')
sha256sums_aarch64=('824c2974ea3af79b5c7137068ee3a99b51fad99e01f023bf466a2c1c3b25e5c0')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/fend/LICENSE"
  install -Dm644 fend.1 -t "$pkgdir/usr/share/man/man1"
}
