# Maintainer: Tássio Virgínio <tassiovirginio@gmail.com>
pkgname=try-rs-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="try-rs CLI tool (binário pré-compilado)"
arch=('x86_64')
url="https://github.com/tassiovirginio/try-rs"
license=('MIT') 
depends=()
source=(
  "try-rs-x86_64-unknown-linux-gnu.tar.gz::https://github.com/tassiovirginio/try-rs/releases/download/v${pkgver}/try-rs-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('SKIP') 

package() {
  cd "$srcdir"

  # desembrulha o tar.gz
  tar -xzf "try-rs-x86_64-unknown-linux-gnu.tar.gz"

  # instala binário
  install -Dm755 "try-rs" "$pkgdir/usr/bin/try-rs"
}

