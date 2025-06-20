# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.111
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.111/opencode-linux-arm64.zip")
sha256sums_aarch64=('3160e2319b3258069a2edd3286855c29a87408080e10718285ac350507d5634d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.111/opencode-linux-x64.zip")
sha256sums_x86_64=('fb508fbc5917d3dac46ba7b4981e2cdf89aa3aed15f8d65f3bb9d68c18779d2a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
