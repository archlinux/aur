# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.67
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.67/opencode-linux-arm64.zip")
sha256sums_aarch64=('8b5f966bfed1c4f1d31cded887f917224e212e8f92271d891d76c7f84fb25d27')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.67/opencode-linux-x64.zip")
sha256sums_x86_64=('c40af9e404cb82403c576e3551709485be31642933b649d73c966255579f4fbe')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
