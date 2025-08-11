# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.4.12
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.12/opencode-linux-arm64.zip")
sha256sums_aarch64=('fcfe97813f447528c98c6c25eef46b3a9680a92783b54128766ebd8232f5b0b4')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.12/opencode-linux-x64.zip")
sha256sums_x86_64=('2ac813c55f9c592e17ee02e63152ec2a217a0d35123378c8c751949e1ad73fab')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
