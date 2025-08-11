# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.4.8
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.8/opencode-linux-arm64.zip")
sha256sums_aarch64=('03e30fa9b9971e4a68a0c0905843b67cf183eebb485b848bded3104ca00e630e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.8/opencode-linux-x64.zip")
sha256sums_x86_64=('538afe29725f8b2da8b578eb390ed612be14e1976c83a2e14ad05368cd02246e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
