# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.96
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.96/opencode-linux-arm64.zip")
sha256sums_aarch64=('18d82462b2ec4623d82f0b7bfa327d146e6402598106d288f425222cbc58eb02')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.96/opencode-linux-x64.zip")
sha256sums_x86_64=('cb9e9b04e0c2cb26b905d51b3666445c78e2aa38a8ca05c6581294596fd80b6e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
