# Maintainer: Tássio Virgínio <tassiovirginio@gmail.com>
pkgname=try-rs-bin
pkgver=0.1.38
pkgrel=1
pkgdesc="try-rs is a CLI tool designed to manage the chaos of temporary projects."
arch=('x86_64')
url="https://github.com/tassiovirginio/try-rs"
license=('MIT') 
depends=()
source=(
  "try-rs-v${pkgver}-linux-x86_64.tar.gz::https://github.com/tassiovirginio/try-rs/releases/download/v${pkgver}/try-rs-v${pkgver}-linux-x86_64.tar.gz"
)
sha256sums=('1610403568a7cf9fdc8fbcbf7a9df8168782c1ca16eb753d8c406d510a3b6265')


package() {
  cd "$srcdir"

  # desembrulha o tar.gz
  tar -xzf "try-rs-v${pkgver}-linux-x86_64.tar.gz"

  # instala binário
  install -Dm755 "try-rs" "$pkgdir/usr/bin/try-rs"
}

