# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.66
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.66/opencode-linux-arm64.zip")
sha256sums_aarch64=('50246b52f3ad41457ff868305949c4187ca7f4d54d9c7cdc45655cabf0520b25')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.66/opencode-linux-x64.zip")
sha256sums_x86_64=('35372fa0c33eb3c04d4064cae0468e2863aad5f14ed6e5553e5720a80706404e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
