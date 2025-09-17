# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.9.11
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.9.11/opencode-linux-arm64.zip")
sha256sums_aarch64=('fc231d3b233821bfba2c60fc4322fbab8bde5ab138752f11e0694ca73e02a36b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.9.11/opencode-linux-x64.zip")
sha256sums_x86_64=('316e90a7006490d2c4098547aa47280c8acbf2e580f84b5fe66c35a9ee559d51')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
