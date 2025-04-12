# Maintainer: Michael Rydén (zynex(at)zoik.se)
# App: avbroot
# Version: 3.15.0
# Webpage: https://github.com/chenxiaolong/avbroot

pkgname=avbroot
pkgver=3.15.0
pkgrel=1
pkgdesc="Application for patching Android A/B-style OTA images for root access"
arch=('x86_64')
url="https://github.com/chenxiaolong/avbroot"
license=('GPL')

source=("https://github.com/chenxiaolong/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-x86_64-unknown-linux-gnu.zip")
sha256sums=('07bbc6ed79100b0a90970dbe08278dc684448d653c9fd29aa7c7c02a4f88c72c')

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
