# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.13.8
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.13.8/opencode-linux-arm64.zip")
sha256sums_aarch64=('a13445d8407f863201989660468bfadab67228cb699ddd26ca1e9e2b494c3187')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.13.8/opencode-linux-x64.zip")
sha256sums_x86_64=('c61a72cc21bdc3e2563bfbe350f2c8bdba27aba8628963553d6c310dc8b20fcd')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
