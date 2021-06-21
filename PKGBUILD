# Maintainer: Jan0660 <jan0660@tutanota.com>

pkgname=revolt-cli-bin
pkgdesc="A CLI client for Revolt"
pkgver=v0.1
pkgrel=1
pkgbase=revolt-cli-bin
replaces=()
arch=('x86_64')
url="https://github.com/Jan0660/Revolt.Cli"
license=('MIT')
groups=()
makedepends=()
depends=('dotnet-runtime')
source=('https://github.com/Jan0660/Revolt.Cli/releases/download/v0.1/linux-x64.revolt-cli')
sha256sums=('169cb26e96c0e802f6ce8a917796f5777c41603d4bf988e632511255984b152e')
options=(!strip)

package() {
  mv linux-x64.revolt-cli revolt-cli
  install -Dm 755 ./revolt-cli -t "${pkgdir}/usr/bin/"
}

