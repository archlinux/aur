# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.61
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.61/opencode-linux-arm64.zip")
sha256sums_aarch64=('6225ce1b2f1e6da88d9cca914f6013d9bbb0a57880b236796caa06c828ec618f')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.61/opencode-linux-x64.zip")
sha256sums_x86_64=('e5756e9a9a0d5f7569766253272f301f6e25b4bbe716a279576f1ca0d05ce615')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
