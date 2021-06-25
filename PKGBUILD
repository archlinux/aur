# Maintainer: Jan0660 <jan0660@tutanota.com>

pkgname=revolt-cli-bin
pkgdesc="A CLI client for Revolt"
pkgver=v0.2.1
pkgrel=1
pkgbase=revolt-cli-bin
replaces=()
arch=('x86_64')
url="https://github.com/Jan0660/Revolt.Cli"
license=('GPL3')
groups=()
makedepends=()
depends=('dotnet-runtime')
source=('https://github.com/Jan0660/Revolt.Cli/releases/download/v0.2.1/linux-x64.revolt-cli')
sha256sums=('SKIP')
options=(!strip)
optdepends=('xsel: provide copy support')

package() {
  mv linux-x64.revolt-cli revolt-cli
  install -Dm 755 ./revolt-cli -t "${pkgdir}/usr/bin/"
}

