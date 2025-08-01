# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.110
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.110/opencode-linux-arm64.zip")
sha256sums_aarch64=('240b2bf2501148d23a77c65900031b37909589fa5f0b211254cc0b0c926cdf30')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.110/opencode-linux-x64.zip")
sha256sums_x86_64=('90f48e872078fb42c7f6661d7bda6f2badd4ed594114d919b04306f1e17ee46a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
