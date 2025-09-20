# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.10.4
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.10.4/opencode-linux-arm64.zip")
sha256sums_aarch64=('44b0923f38cd4ddfaed8bd05ff7031f22fa9a8df5b430650d169e20a620f5589')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.10.4/opencode-linux-x64.zip")
sha256sums_x86_64=('7322a4144cbdf4fc281e27b3ba9c960119db554020fd1dada139c16fa9b7679f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
