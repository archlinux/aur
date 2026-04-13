# Maintainer:hnchengzong 
pkgname=hn-randfile-rust-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Random file generator CLI tool"
arch=('x86_64')
url="https://github.com/hnchengzong/hn-randfile-rust"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hnchengzong/hn-randfile-rust/releases/download/v$pkgver/hn-randfile-rust-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('8490b0a224769d4874b19274f12b450e7ec7964a74b19433ec1fe707cab0b770')
package() {
  cp -r usr/ "$pkgdir/"
}
