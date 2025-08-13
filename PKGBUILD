# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.4.45
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.45/opencode-linux-arm64.zip")
sha256sums_aarch64=('000e2c119caecfaba62385ec149b20a4af2dd96c4a10701a4b01fcf6a99eab92')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.45/opencode-linux-x64.zip")
sha256sums_x86_64=('f3afc12aac641650d173aca920260f2ce5484f71e849a65d20c7080a50da68d6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
