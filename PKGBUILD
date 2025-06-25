# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.139
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.139/opencode-linux-arm64.zip")
sha256sums_aarch64=('ad2defe5dbf38fcad884f0b4ef25ade1948e3a60721f9b1ce9a2fc2b6a3bdc55')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.139/opencode-linux-x64.zip")
sha256sums_x86_64=('d999ebce60016eb1a3fdae78cab5ee776f120c31ece49bbfbfc2c4954f935911')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
