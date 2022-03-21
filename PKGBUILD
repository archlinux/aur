# Maintainer: Funami
pkgname=fdroidcl-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="F-Droid desktop client"
arch=('x86_64' 'i686')
url="https://github.com/mvdan/fdroidcl"
license=('BSD')
provides=('fdroidcl')
conflicts=('fdroidcl')
source=("https://raw.githubusercontent.com/mvdan/fdroidcl/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/mvdan/fdroidcl/releases/download/v$pkgver/fdroidcl_v${pkgver}_linux_amd64")
source_i686=("$pkgname-$pkgver-i686::https://github.com/mvdan/fdroidcl/releases/download/v$pkgver/fdroidcl_v${pkgver}_linux_386")
sha256sums=('6b44db2e2b57c1f8a3b44f105650813bbef494e0472cb76620d4dfbffd96f988')
sha256sums_x86_64=('e1bf97bf0c93e1c9bbeb1ab6a5f00f0e45a55708a037cb3f860966e26d94e98f')
sha256sums_i686=('e2dc8143840e0e4fd33d4fc198e407f22fbeccc1400e447bfc30e08fedd37252')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/fdroidcl"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/fdroidcl"
}
