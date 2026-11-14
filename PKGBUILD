# Maintainer: dii2r2
# Contributor:
# Prebuilt Linux x64 release from GitHub.

pkgname=elite-insights-bin
pkgver=3.32.0.0
pkgrel=1
pkgdesc='Guild Wars 2 Elite Insights (prebuilt Linux binary)'
arch=('x86_64')
url='https://github.com/baaron4/GW2-Elite-Insights-Parser/releases'
license=('MIT')
options=('!strip')
depends=('dotnet-runtime-10.0' 'libx11' 'libxcb' 'libxkbcommon' 'mesa')
source=("https://github.com/baaron4/GW2-Elite-Insights-Parser/releases/download/v${pkgver}/GW2EI-linux_amd64.deb")
sha256sums=('916b53db382365029bd07991c101fb945f0d8461615e2a515c55eb38503ef690')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
