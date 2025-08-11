# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.4.20
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.20/opencode-linux-arm64.zip")
sha256sums_aarch64=('581a32c28d219ad6c011df72def0c825daf6ca5c758cff6fa4e9a21a5296f50b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.20/opencode-linux-x64.zip")
sha256sums_x86_64=('3ea5e2aaaa665f01a2e026ce9fd9e63987658032c89f916bcfad3d64b06de2ba')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
