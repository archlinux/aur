# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.76
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.76/opencode-linux-arm64.zip")
sha256sums_aarch64=('9cd8267b4ea61f66863669ae97522bdfc85cbc4218071b0e0604254168d4f421')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.76/opencode-linux-x64.zip")
sha256sums_x86_64=('4aa35ba8312aee6685e066b5d137c1593335853e6a436bc723ee79dbd529e473')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
