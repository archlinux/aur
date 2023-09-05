# Maintainer: Michael Rydén (zynex(at)zoik.se)
# App: avbroot
# Version: 2.0.1
# Webpage: https://github.com/chenxiaolong/avbroot

pkgname=avbroot-bin
_pkgname=avbroot
pkgver=2.0.1
pkgrel=1
pkgdesc="Application for patching Android A/B-style OTA images for root access"
arch=('x86_64')
url="https://github.com/chenxiaolong/avbroot"
license=('GPL')

source=("https://github.com/chenxiaolong/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.zip")
md5sums=('4b81754981ee3e6f8e3587137fe79e46')

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
