# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.33
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.33/opencode-linux-arm64.zip")
sha256sums_aarch64=('839bdd1a70fc1522aeeaa8a6b6fb90755f8facbfee9a48ff9b8ef61751a3e4c3')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.33/opencode-linux-x64.zip")
sha256sums_x86_64=('4eff41ee9ee0c3d75642630cfae1b9cd0703ffc355e10d03742f5b95a5d36836')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
