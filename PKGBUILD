# Maintainer: Tássio Virgínio <tassiovirginio@gmail.com>
pkgname=envy-tui-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A Terminal User Interface (TUI) manager for EnvyControl - Easy GPU switching for Nvidia Optimus laptops under Linux."
arch=('x86_64')
url="https://github.com/tassiovirginio/envy-tui"
license=('MIT') 
depends=('envycontrol')
source=(
  "envy-tui-v${pkgver}-linux-x86_64.tar.gz::https://github.com/tassiovirginio/envy-tui/releases/download/v${pkgver}/envy-tui-v${pkgver}-linux-x86_64.tar.gz"
)
sha256sums=('51fbb38b36c494d5d09f884740edd6026dc846cb63d8372fac454f93ad5b1829')


package() {
  cd "$srcdir"

  # desembrulha o tar.gz
  tar -xzf "envy-tui-v${pkgver}-linux-x86_64.tar.gz"

  # instala binário
  install -Dm755 "envy-tui" "$pkgdir/usr/bin/envy-tui"
}

