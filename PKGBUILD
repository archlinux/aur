# Maintainer: Max Liebkies <mail at maxliebkies dot de>

pkgname=dotnet-sdk-1.1
pkgver="1.0.4"
pkgrel=1
pkgdesc="Provides the .NET core software development kit (sdk)."
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
depends=('dotnet-runtime-1.1' 'dotnet-host')
makedepends=()
conflicts=('dotnet-bin')
options=('staticlibs')
install=

source=("${pkgname}-${pkgver}.tar.gz::https://download.microsoft.com/download/E/7/8/E782433E-7737-4E6C-BFBF-290A0A81C3D7/dotnet-dev-ubuntu.16.10-x64.1.0.4.tar.gz")

sha256sums=('9e784b554a9cb68df9ce541cc220dafcb71b185837e05420c182e4a496b68f47')

package() {
  mkdir -p "${pkgdir}/opt/dotnet/"

  cp --force --preserve=mode --recursive "${srcdir}/sdk/" "${pkgdir}/opt/dotnet" 
  
}

# vim:set ts=2 sw=2 et:
