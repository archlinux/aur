# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.42
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.42/opencode-linux-arm64.zip")
sha256sums_aarch64=('6242c47f921a5e528ca76d4cbfd6011f6178af6367662d84ef9f2e56d705f868')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.42/opencode-linux-x64.zip")
sha256sums_x86_64=('ba2a2b5d6a7ebd4591e39dbe7a7b9f71f3564c9115597a8f4f7acf8e1673c434')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
