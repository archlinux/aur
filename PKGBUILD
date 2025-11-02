# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.13
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('fd2388ab71de508f0d22de16f217c1d81657063c6da8f7e2ccc9746fcf6acb9a')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('fdcce07d2c21f6f2029cb8e37ff80b5f21231c21f0eedae57a7d3e099eea46e6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
