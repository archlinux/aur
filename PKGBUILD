# Maintainer: Tássio Virgínio <tassiovirginio@gmail.com>
pkgname=try-rs-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="try-rs is a CLI tool designed to manage the chaos of temporary projects, organizes them into date-prefixed directories, offering a robust TUI (Terminal User Interface) to create, navigate, and clean up your experiments."
arch=('x86_64')
url="https://github.com/tassiovirginio/try-rs"
license=('MIT') 
depends=()
source=(
  "try-rs-v${pkgver}-linux-x86_64.tar.gz::https://github.com/tassiovirginio/try-rs/releases/download/v${pkgver}/try-rs-v${pkgver}-linux-x86_64.tar.gz"
)
sha256sums=('33991012393bc8aa747bdee02b5251a628012edecd1975c9808122f328b0336e')


package() {
  cd "$srcdir"

  # desembrulha o tar.gz
  tar -xzf "try-rs-v${pkgver}-linux-x86_64.tar.gz"

  # instala binário
  install -Dm755 "try-rs" "$pkgdir/usr/bin/try-rs"
}

