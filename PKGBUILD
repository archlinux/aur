# Maintainer: J Henrique <jhenrique04@proton.me>
pkgname=cargo-licenses
pkgver=0.2.0
pkgrel=1
pkgdesc="A tool to audit license information for Rust projects"
arch=('x86_64')
url="https://github.com/jhenrique04/cargo-licenses"
license=('MIT' 'Apache')
depends=('rust' 'cargo')
source=("cargo-licenses-v$pkgver-x86_64-linux.tar.gz::https://github.com/jhenrique04/cargo-licenses/releases/download/$pkgver/cargo-licenses-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('b465762f00001a9faffffeaf66ff9dc80868a0f7a6109e8432f239cc01a7088b')

package() {
  install -Dm755 "target/release/cargo-licenses" "$pkgdir/usr/bin/cargo-licenses"

  #README and licenses can be checked at https://github.com/jhenrique04/cargo-licenses
}
