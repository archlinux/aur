# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.1
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.1/opencode-linux-arm64.zip")
sha256sums_aarch64=('645bfaafa9ee8a0fe327faaba073ae42a49d074e4d95c527f9c5234668cec119')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.1/opencode-linux-x64.zip")
sha256sums_x86_64=('9db3b38aeb5ded138fa87c1731ffbdbcfb47f2cfb9246716f31da15eca5510d6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
