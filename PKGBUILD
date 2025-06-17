# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.72
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.72/opencode-linux-arm64.zip")
sha256sums_aarch64=('3d6a12acb44fb243b7839550af08a62fdf726cc70f2bdf897d74fe4ad3030959')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.72/opencode-linux-x64.zip")
sha256sums_x86_64=('943e93d3002830962f86e58435d0b7420d98cac0841c649ce5c53bae293ed2d0')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
