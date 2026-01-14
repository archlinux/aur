# Maintainer: Tássio Virgínio <tassiovirginio@gmail.com>
pkgname=envy-tui-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="A Terminal User Interface (TUI) manager for EnvyControl - Easy GPU switching for Nvidia Optimus laptops under Linux."
arch=('x86_64')
url="https://github.com/tassiovirginio/envy-tui"
license=('MIT') 
depends=('envycontrol')
source=(
  "envy-tui-v${pkgver}-linux-x86_64.tar.gz::https://github.com/tassiovirginio/envy-tui/releases/download/v${pkgver}/envy-tui-v${pkgver}-linux-x86_64.tar.gz"
)
sha256sums=('d33092c12d722dc809001a32d15d4eefd838852fcee23acf612b803cb081669c')


package() {
  cd "$srcdir"

  # desembrulha o tar.gz
  tar -xzf "envy-tui-v${pkgver}-linux-x86_64.tar.gz"

  # instala binário
  install -Dm755 "envy-tui" "$pkgdir/usr/bin/envy-tui"
}

