# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.113
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.113/opencode-linux-arm64.zip")
sha256sums_aarch64=('25bef2e3e6526cde37a434fa676f93db130482f7edd16beae5019b8d6330fc38')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.113/opencode-linux-x64.zip")
sha256sums_x86_64=('7737fd7a98e014a3d6a1a042e97cb85d2d1e287f432db439f81a0dbf015d8dfe')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
