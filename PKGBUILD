# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.79
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.79/opencode-linux-arm64.zip")
sha256sums_aarch64=('64f1249b52769cbe9f5406b3b05aab2f48a3300cc8c34d6b7b4b5407661fd0c3')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.79/opencode-linux-x64.zip")
sha256sums_x86_64=('df5f0591ec647b5a597864cffd40863e9a1cdcf6ea85bde37156fdc966adf7fc')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
