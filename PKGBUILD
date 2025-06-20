# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.115
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.115/opencode-linux-arm64.zip")
sha256sums_aarch64=('943bf4e0076a11c078e652844f12630edc0aae32b4e1832c3b91fb4aa9ab2c8b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.115/opencode-linux-x64.zip")
sha256sums_x86_64=('08cae98cdc70891032a6bc5160c091294b2cd8dba6960c96202c60205cf44671')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
