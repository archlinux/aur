# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.8
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.8/opencode-linux-arm64.zip")
sha256sums_aarch64=('b7a2984321b07cdf42f90eafc0147de26da66f6cf57d11fa6e38798014579082')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.8/opencode-linux-x64.zip")
sha256sums_x86_64=('8524ce0644bbd754d15aa1071c2c9a9a55e5da9122b3388b216330592c6f3af8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
