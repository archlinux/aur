# Maintainer: Jan0660 <jan0660@tutanota.com>

pkgname=revolt-cli-bin
pkgdesc="A CLI client for Revolt"
pkgver=v0.2.0
pkgrel=1
pkgbase=revolt-cli-bin
replaces=()
arch=('x86_64')
url="https://github.com/Jan0660/Revolt.Cli"
license=('GPL3')
groups=()
makedepends=()
depends=('dotnet-runtime' 'xsel')
source=('https://github.com/Jan0660/Revolt.Cli/releases/download/v0.2.0/linux-x64.revolt-cli')
sha256sums=('deb963bfe206dba480890566235e8af7eb2eb5a44953c1eae7d61ac24a0d7ae8')
options=(!strip)

package() {
  mv linux-x64.revolt-cli revolt-cli
  install -Dm 755 ./revolt-cli -t "${pkgdir}/usr/bin/"
}

