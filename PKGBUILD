# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.86
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.86/opencode-linux-arm64.zip")
sha256sums_aarch64=('b357a7a09665297fd70cfd7ce2f90e2a66922330dd134c9209e0f809cb32f74a')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.86/opencode-linux-x64.zip")
sha256sums_x86_64=('9c35bf8a534b01956cb21f19add820ef83baf32d36eccde0058b4887551bd97f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
