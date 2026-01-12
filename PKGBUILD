# Maintainer: Tássio Virgínio <tassiovirginio@gmail.com>
pkgname=envy-tui-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A Terminal User Interface (TUI) manager for EnvyControl - Easy GPU switching for Nvidia Optimus laptops under Linux."
arch=('x86_64')
url="https://github.com/tassiovirginio/try-rs"
license=('MIT') 
depends=()
source=(
  "envy-tui-v${pkgver}-linux-x86_64.tar.gz::https://github.com/tassiovirginio/envy-tui/releases/download/v${pkgver}/envy-tui-v${pkgver}-linux-x86_64.tar.gz"
)
sha256sums=('ad4b628579235a62b6ac64f3f43d5653a88537f5c4cdcc8f2822efb9cc9b072c')


package() {
  cd "$srcdir"

  # desembrulha o tar.gz
  tar -xzf "envy-tui-v${pkgver}-linux-x86_64.tar.gz"

  # instala binário
  install -Dm755 "envy-tui" "$pkgdir/usr/bin/envy-tui"
}

