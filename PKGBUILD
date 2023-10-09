# Maintainer: Michael Rydén (zynex(at)zoik.se)
# App: avbroot
# Version: 2.0.1
# Webpage: https://github.com/chenxiaolong/avbroot

pkgname=avbroot
pkgver=2.2.0
pkgrel=1
pkgdesc="Application for patching Android A/B-style OTA images for root access"
arch=('x86_64')
url="https://github.com/chenxiaolong/avbroot"
license=('GPL')

source=("https://github.com/chenxiaolong/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-x86_64-unknown-linux-gnu.zip")
md5sums=('f03bee04a504bedb0473bc2f03dcdf1c')

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
