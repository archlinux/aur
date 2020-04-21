pkgname=dotnet-sdk-lts-bin
pkgver="3.1.201"
pkgrel=1
pkgdesc="Provides the .NET core software development kit (sdk)."
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
depends=('dotnet-runtime' 'dotnet-host')
makedepends=()
options=('staticlibs')

source=("https://download.visualstudio.microsoft.com/download/pr/f65a8eb0-4537-4e69-8ff3-1a80a80d9341/cc0ca9ff8b9634f3d9780ec5915c1c66/dotnet-sdk-${pkgver}-linux-x64.tar.gz")
sha256sums=('222f5363d2ab9f2aa852846bc0745c449677d1cccf8c8407cd0a44d3299cc7be')


package() {
  mkdir -p "${pkgdir}/opt/dotnet/"

  cp --force --preserve=mode --recursive "${srcdir}/sdk/" "${pkgdir}/opt/dotnet" 
  
}
