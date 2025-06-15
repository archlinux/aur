# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.45
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.45/opencode-linux-arm64.zip")
sha256sums_aarch64=('7b18b6d2d429a24bdd17cadad1dfa514d41711c362d5ca48bd69e1a0167c07dc')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.45/opencode-linux-x64.zip")
sha256sums_x86_64=('001624234dad3fba13c2daeb1391a2c65e5d380d6026be5e9d6573c9ef20be24')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
