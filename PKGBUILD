# Maintainer:hnchengzong 
pkgname=hn-randfile-rust
pkgver=0.1.0
pkgrel=1
pkgdesc="Random file generator CLI tool"
arch=('x86_64')
url="https://github.com/hnchengzong/hn-randfile-rust"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hnchengzong/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('e4862fb27bae016128db45482606fbcfb6393fd4a9223da33c037e1156909e58')
package() {
  cp -r usr/ "$pkgdir/"
}
