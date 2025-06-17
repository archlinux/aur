# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.69
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.69/opencode-linux-arm64.zip")
sha256sums_aarch64=('96d692e48e2a94f9788ae901033e00b3cb81e459d8af8b9756813ba4a291f8af')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.69/opencode-linux-x64.zip")
sha256sums_x86_64=('0035008ea2e92f74b84aaa4388445128e2748c7583b1ad8596459b380b6f5526')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
