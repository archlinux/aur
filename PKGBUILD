# Mainainer: Animo Solutions contact@animo.id
pkgname="aries-cli"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="A CLI tool for Aries written in rust"
arch=(x86_64)
license=('MIT')
depends=()
provides=('aries-cli')
md5sums=()

package() {
  sudo mkdir -p /usr/share/licenses/${pkgname}
  sudo curl -L -o /usr/share/licenses/${pkgname}/LICENSE https://raw.githubusercontent.com/animo/aries-cli/main/LICENSE
  echo "Fetching aries-cli binary"
  sudo curl -L -o /usr/bin/${pkgname} https://github.com/animo/${pkgname}/releases/download/v${pkgver}/linux-x86_64-aries-cli
  sudo chmod +x /usr/bin/${pkgname}
  echo "Successfully installed aries-cli"
  echo "Enjoy the tool"
}
