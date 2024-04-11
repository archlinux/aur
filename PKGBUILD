# Maintainer: Funami
pkgname=fend-bin
pkgver=1.4.6
pkgrel=2
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/printfn/fend"
license=('MIT')
provides=('fend')
conflicts=('fend')
source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/printfn/fend/v$pkgver/LICENSE.md"
        "$pkgname-$pkgver-fend.1::https://github.com/printfn/fend/releases/download/v$pkgver/fend.1")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-x64.zip")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-armv7-gnueabihf.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-aarch64-gnu.zip")
sha256sums=('1992e36d631c5f8df9716fb1b736b3b138157ff98c87baa9889be7593841a1df'
            '6a4d2ce5593ea4d5b61be4712c93024d7658a2da514f1cb385f808eefed528cc')
sha256sums_x86_64=('8b6495e071d5d66d7145743e1983eea9ccb052cb301b473f959b408aa354b8d4')
sha256sums_armv7h=('a0e9526e2fc7467358e10c8f0e2548fb5d83146200a857c1e8e9ba8f0bb226b0')
sha256sums_aarch64=('15df626a4d570bb386142fb28067109018e8881df855c1bdc939bb3bdf4c60f2')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/fend/LICENSE"
  install -Dm644 "$pkgname-$pkgver-fend.1" "$pkgdir/usr/share/man/man1/fend.1"
}
