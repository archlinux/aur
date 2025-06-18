# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.80
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.80/opencode-linux-arm64.zip")
sha256sums_aarch64=('f00b1c61d2c78adfb25a8e976945ace901624055d259982a73dbd51b380f8ffd')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.80/opencode-linux-x64.zip")
sha256sums_x86_64=('0d07696acea62ba4a937401b0b3a5e0e0752b61af095fa91c833725f52fd8252')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
