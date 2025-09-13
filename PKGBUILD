# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.7.9
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.7.9/opencode-linux-arm64.zip")
sha256sums_aarch64=('c2d4f044d391ddeea4f5f5477509c54c42dc566163649bb044be23492d11be47')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.7.9/opencode-linux-x64.zip")
sha256sums_x86_64=('573d9c43f9cf0bf90a29a814c0c43f55a89233e7c94660ff6ed373d45f86ff33')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
