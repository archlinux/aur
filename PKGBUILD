# Maintainer: Funami
pkgname=fend-bin
pkgver=1.4.3
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
sha256sums=('b2a23e220473a9151f76bf18dc27c94ccc09afe4b7eacb49848d0a181bfdee38')
sha256sums_x86_64=('385f0efea8c2a2c87c40d01b0cc1d31262918b7742c32d6ea32db3a7df894890')
sha256sums_armv7h=('4e2e02063372cd65f26b08fa6d173815795fd9eb5911a751adbd1eb20f1fbfe2')
sha256sums_aarch64=('b8bba09ad9af65b8daf7f82780f4240690c7f8cb478de2546e7c6191c41f1fd2')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 fend.1 -t "$pkgdir/usr/share/man/man1"
}
