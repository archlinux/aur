# Maintainer: Tássio Virgínio <tassiovirginio@gmail.com>
pkgname=envy-tui-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A Terminal User Interface (TUI) manager for EnvyControl - Easy GPU switching for Nvidia Optimus laptops under Linux."
arch=('x86_64')
url="https://github.com/tassiovirginio/envy-tui"
license=('MIT') 
depends=('envycontrol')
source=(
  "envy-tui-v${pkgver}-linux-x86_64.tar.gz::https://github.com/tassiovirginio/envy-tui/releases/download/v${pkgver}/envy-tui-v${pkgver}-linux-x86_64.tar.gz"
)
sha256sums=('d418a455b96c8b73d9f993ba272272e72729a6f6e82d0e00eb25abc2fb7826f1')


package() {
  cd "$srcdir"

  # desembrulha o tar.gz
  tar -xzf "envy-tui-v${pkgver}-linux-x86_64.tar.gz"

  # instala binário
  install -Dm755 "envy-tui" "$pkgdir/usr/bin/envy-tui"
}

