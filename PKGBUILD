# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.103
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.103/opencode-linux-arm64.zip")
sha256sums_aarch64=('11375c43629fd5a92acc697085c2639b6f120aa85411812f2ba672e947c436a5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.103/opencode-linux-x64.zip")
sha256sums_x86_64=('ddd07af114cfe556c98adcefdef5fe3d6416ac4800661a062e0f6683724b0d0a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
