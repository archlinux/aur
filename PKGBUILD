# Maintainer: Max Liebkies <mail at maxliebkies dot de>

pkgname=dotnet-sdk
pkgver="1.0.1"
pkgrel=1
pkgdesc="Provides the .NET core software development kit (sdk)."
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
depends=('dotnet' 'dotnet-cli')
makedepends=()
conflicts=('dotnet-bin')
options=('staticlibs')
install=

source=("${pkgname}-${pkgver}.tar.gz::https://go.microsoft.com/fwlink/?LinkID=843446")

sha256sums=('828af612b3e691f27d93153c3c7fd561e041535e907e9823f206ccab51030ecf')

package() {
  mkdir -p "${pkgdir}/opt/dotnet/"

  cp --force --preserve=mode --recursive "${srcdir}/sdk/" "${pkgdir}/opt/dotnet" 
  
}

# vim:set ts=2 sw=2 et:
