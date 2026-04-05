# Maintainer:hnchengzong 
pkgname=hn-randfile-rust-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Random file generator CLI tool"
arch=('x86_64')
url="https://github.com/hnchengzong/hn-randfile-rust"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hnchengzong/hn-randfile-rust/releases/download/v$pkgver/hn-randfile-rust-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('c384808da6842c0b4d28adcd0dc0dd6e56c592adf3c16d618915b4b6b85667b4')
package() {
  cp -r usr/ "$pkgdir/"
}
