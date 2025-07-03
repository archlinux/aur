# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.183
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.183/opencode-linux-arm64.zip")
sha256sums_aarch64=('a83a00b3008dd91984044c5ac3a471758d6ccea6322e84c1a65f9b39bc0f5a69')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.183/opencode-linux-x64.zip")
sha256sums_x86_64=('4de3947cce6b911855ef33f01a8b82364212cc1e5337e8e192a00a7654bc3d76')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
