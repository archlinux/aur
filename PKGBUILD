# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.116
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.116/opencode-linux-arm64.zip")
sha256sums_aarch64=('6bf1e98472f925dafc2b31df05d1e7884fbca85503379dee92ef161c54a56434')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.116/opencode-linux-x64.zip")
sha256sums_x86_64=('2f9ceebb24e27d77b7177539eb352401c2f52ef66a5c21c51ca4dfef1c69824d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
