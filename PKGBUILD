# Maintainer: Michael Rydén (zynex(at)zoik.se)
# App: avbroot
# Version: 3.15.0
# Webpage: https://github.com/chenxiaolong/avbroot

pkgname=avbroot
pkgver=3.16.1
pkgrel=1
pkgdesc="Application for patching Android A/B-style OTA images for root access"
arch=('x86_64')
url="https://github.com/chenxiaolong/avbroot"
license=('GPL')

source=("https://github.com/chenxiaolong/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-x86_64-unknown-linux-gnu.zip")
sha256sums=('3504661e00e456a374a0b281d0eec066feea7f009990837de158701ffbaf1966')

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
