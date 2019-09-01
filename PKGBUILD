pkgname=dotnet-sdk-lts-bin
pkgver="2.1.801"
pkgrel=1
pkgdesc="Provides the .NET core software development kit (sdk)."
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
depends=('dotnet-runtime' 'dotnet-host')
makedepends=()
options=('staticlibs')

source=("https://download.visualstudio.microsoft.com/download/pr/b95d51d0-6be0-49eb-aae7-4092c77634d3/4dd3723dcee0d50ad5e5ead5f4f4127e/dotnet-sdk-${pkgver}-linux-x64.tar.gz")
sha256sums=('bec7886110ead64ec231583fc30eebd405f4f8676de1762f501b69cc865258c7')


package() {
  mkdir -p "${pkgdir}/opt/dotnet/"

  cp --force --preserve=mode --recursive "${srcdir}/sdk/" "${pkgdir}/opt/dotnet" 
  
}
