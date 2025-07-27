# Maintainer: Michael Rydén (zynex(at)zoik.se)
# App: avbroot
# Version: 3.15.0
# Webpage: https://github.com/chenxiaolong/avbroot

pkgname=avbroot
pkgver=3.17.2
pkgrel=1
pkgdesc="Application for patching Android A/B-style OTA images for root access"
arch=('x86_64')
url="https://github.com/chenxiaolong/avbroot"
license=('GPL')

source=("https://github.com/chenxiaolong/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-x86_64-unknown-linux-gnu.zip")
sha256sums=('dac4a572380e1797105c4c9dab15d1b73a333b2482f8aa487f6251406c10dabd')

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
