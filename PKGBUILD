# Maintainer: Tássio Virgínio <tassiovirginio@gmail.com>
pkgname=try-rs-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="try-rs is a CLI tool designed to manage the chaos of temporary projects."
arch=('x86_64')
url="https://github.com/tassiovirginio/try-rs"
license=('MIT') 
depends=()
source=(
  "try-rs-v${pkgver}-linux-x86_64.tar.gz::https://github.com/tassiovirginio/try-rs/releases/download/v${pkgver}/try-rs-v${pkgver}-linux-x86_64.tar.gz"
)
sha256sums=('babfc66d80c2de7bad42fda6ccf9b70f53499d26f4dececb8412b0f7b7a23504')


package() {
  cd "$srcdir"

  # desembrulha o tar.gz
  tar -xzf "try-rs-v${pkgver}-linux-x86_64.tar.gz"

  # instala binário
  install -Dm755 "try-rs" "$pkgdir/usr/bin/try-rs"
}

