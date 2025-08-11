# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.4.15
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.15/opencode-linux-arm64.zip")
sha256sums_aarch64=('02c4600905d2c0912d274e2dc5c3736cb57e626fe43b6874718558f8b3671706')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.15/opencode-linux-x64.zip")
sha256sums_x86_64=('32780e65647869f5af184539b57bd7154838b06d5e8246e21bb8806112cdf187')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
