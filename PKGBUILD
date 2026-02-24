# Maintainer: Tássio Virgínio <tassiovirginio@gmail.com>
pkgname=try-rs-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="try-rs is a CLI tool designed to manage the chaos of temporary projects."
arch=('x86_64')
url="https://github.com/tassiovirginio/try-rs"
license=('MIT') 
depends=()
source=(
  "try-rs-v${pkgver}-linux-x86_64.tar.gz::https://github.com/tassiovirginio/try-rs/releases/download/v${pkgver}/try-rs-v${pkgver}-linux-x86_64.tar.gz"
)
sha256sums=('b96c8e2d870b85a1ed529e40f26b965b823a6f4aa4affafc472889c55ad6948e')


package() {
  cd "$srcdir"

  # desembrulha o tar.gz
  tar -xzf "try-rs-v${pkgver}-linux-x86_64.tar.gz"

  # instala binário
  install -Dm755 "try-rs" "$pkgdir/usr/bin/try-rs"
}

