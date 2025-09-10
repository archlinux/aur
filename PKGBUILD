# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.6.10
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.6.10/opencode-linux-arm64.zip")
sha256sums_aarch64=('e183f4efad88ca30daeb62a7f8f1dce7d8db7aefcbb376db405bfb0488a62c2f')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.6.10/opencode-linux-x64.zip")
sha256sums_x86_64=('b21df4f7e7bb4fb95b71af08be568f760c8985cf05f2adfe6278c1fec76d54a4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
