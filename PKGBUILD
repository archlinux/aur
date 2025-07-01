#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=tldx-bin
pkgver=1.2.4
pkgrel=1
pkgdesc="Domain Availability Research Tool"
arch=('x86_64' 'aarch64')
conflicts=('tldx')
provides=('tldx')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/brandonyoungdev/tldx/releases/download/v$pkgver/tldx_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/brandonyoungdev/tldx/releases/download/v$pkgver/tldx_${pkgver}_linux_arm64.tar.gz")
url="https://github.com/brandonyoungdev/tldx"
license=("Apache-2.0")
sha256sums_x86_64=('af372a5800049aa2907fda520b942c3b4c9de6504f5b428cbf672ba8861600d2')
sha256sums_aarch64=('180e73c6fcedec36dc1c7b5238ca8272394225148810d27c1d8ba8b8fc29d84d')

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "tldx" "$pkgdir/usr/bin/tldx"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/tldx/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/tldx/LICENSE"
}
