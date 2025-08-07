# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.133
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.133/opencode-linux-arm64.zip")
sha256sums_aarch64=('0f1d9e45aa6e57d60969283b923248d045566a22e71b2fffd2594cf2e2c82d8e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.133/opencode-linux-x64.zip")
sha256sums_x86_64=('f34ca9305ee2add41559d55970d5724e735bde6df98284ad2c5d2304a4bc8ec2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
