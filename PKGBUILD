# Mainainer: Animo Solutions contact@animo.id
pkgname="agent-cli"
pkgver=0.3.1
pkgrel="1"
pkgdesc="A CLI tool for Aries written in Rust"
arch=(x86_64)
license=('MIT')
depends=()
provides=('agent-cli')
md5sums=()

package() {
  sudo mkdir -p /usr/share/licenses/${pkgname}
  sudo curl -L -o /usr/share/licenses/${pkgname}/LICENSE https://raw.githubusercontent.com/animo/agent-cli/main/LICENSE
  sudo curl -L -o /usr/bin/${pkgname} https://github.com/animo/${pkgname}/releases/download/v${pkgver}/linux-x86_64-agent-cli
  sudo chmod +x /usr/bin/${pkgname}
}
