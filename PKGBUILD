# Maintainer: dii2r2
# Contributor:
# Prebuilt Linux x64 release from GitHub.

pkgname=elite-insights-bin
pkgver=3.33.0.0
pkgrel=1
pkgdesc='Guild Wars 2 Elite Insights (prebuilt Linux binary)'
arch=('x86_64')
url='https://github.com/baaron4/GW2-Elite-Insights-Parser/releases'
license=('MIT')
options=('!strip')
depends=('dotnet-runtime-10.0' 'libx11' 'libxcb' 'libxkbcommon' 'mesa')
source=("https://github.com/baaron4/GW2-Elite-Insights-Parser/releases/download/v${pkgver}/GW2EI-linux_amd64.deb")
sha256sums=('ed016ec0b05a2910c91984f2eea7a2ddaec5ad5282a370c46c99329b7b527c7e')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
