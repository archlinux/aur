# Maintainer: dii2r2
# Contributor:
# Prebuilt Linux x64 release from GitHub.

pkgname=elite-insights-bin
pkgver=3.30.1.0
pkgrel=1
pkgdesc='Guild Wars 2 Elite Insights (prebuilt Linux binary)'
arch=('x86_64')
url='https://github.com/baaron4/GW2-Elite-Insights-Parser/releases'
license=('MIT')
options=('!strip')
depends=('dotnet-runtime-8.0>=8.0.31' 'libx11' 'libxcb' 'libxkbcommon' 'mesa')
source=("https://github.com/baaron4/GW2-Elite-Insights-Parser/releases/download/v${pkgver}/GW2EI-linux_amd64.deb")
sha256sums=('585423c57e394671f89d5e85654690ac8fc45b7575853eb263fdc0e911520b41')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
