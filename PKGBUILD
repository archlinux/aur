# Mainainer: Animo Solutions contact@animo.id
pkgname="siera"
pkgver="0.0.0"
pkgrel="1"
pkgdesc="A CLI tool for Hyperledger Aries written in Rust"
arch=(x86_64)
license=('MIT')
depends=()
provides=('siera')
md5sums=()

package() {
  sudo mkdir -p /usr/share/licenses/${pkgname}
  sudo curl -L -o /usr/share/licenses/${pkgname}/LICENSE https://raw.githubusercontent.com/animo/siera/main/LICENSE
  sudo curl -L -o /usr/bin/${pkgname} https://github.com/animo/${pkgname}/releases/download/v${pkgver}/linux-x86_64-siera
  sudo chmod +x /usr/bin/${pkgname}
}
