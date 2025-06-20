# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.110
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.110/opencode-linux-arm64.zip")
sha256sums_aarch64=('fd48fb2a093fd39f0e66f1982aedbfddd91cf840142b5dbcca4afdb2b2b638ce')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.110/opencode-linux-x64.zip")
sha256sums_x86_64=('8ec84103ce96df9bc0a10ef05d79ac20d64c39eef0e2375e5a1fdfd4e4333da3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
