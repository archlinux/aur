# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.121
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.121/opencode-linux-arm64.zip")
sha256sums_aarch64=('330b2a76e4f2dc7c4af8f58b1c8077d390176a8ef6c4dfa73b328ae1a6281032')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.121/opencode-linux-x64.zip")
sha256sums_x86_64=('1eb3ccb31d171f1ae902e4f6bbc2b415a725926604b88c961d5beb4d4d957dd9')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
