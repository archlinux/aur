# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.112
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.112/opencode-linux-arm64.zip")
sha256sums_aarch64=('d28a669a32cf6e8b99bf481cae1936c7491fb209932aea873ac4a780974bdb73')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.112/opencode-linux-x64.zip")
sha256sums_x86_64=('7433849eb89cb35f91d867cc0a1781374741a5a4c3d3f11652b9586cb14929c8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
