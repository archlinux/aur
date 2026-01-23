# Maintainer: Tássio Virgínio <tassiovirginio@gmail.com>
pkgname=try-rs-bin
pkgver=0.1.46
pkgrel=1
pkgdesc="try-rs is a CLI tool designed to manage the chaos of temporary projects."
arch=('x86_64')
url="https://github.com/tassiovirginio/try-rs"
license=('MIT') 
depends=()
source=(
  "try-rs-v${pkgver}-linux-x86_64.tar.gz::https://github.com/tassiovirginio/try-rs/releases/download/v${pkgver}/try-rs-v${pkgver}-linux-x86_64.tar.gz"
)
sha256sums=('8afc0c73761c8cd36da0c5d5d19bf9d0017973bdcb8aa298252b7dcfbcf354c3')


package() {
  cd "$srcdir"

  # desembrulha o tar.gz
  tar -xzf "try-rs-v${pkgver}-linux-x86_64.tar.gz"

  # instala binário
  install -Dm755 "try-rs" "$pkgdir/usr/bin/try-rs"
}

