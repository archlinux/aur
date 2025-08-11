# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.4.10
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.10/opencode-linux-arm64.zip")
sha256sums_aarch64=('f3801007de75e1723f96240e33134d602ff8179fbfe07bf66afaa0d653b1456a')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.10/opencode-linux-x64.zip")
sha256sums_x86_64=('6f321ee028ce3828c4ed37817131b4b4960633359c7483d2baeaec8356e13a3f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
