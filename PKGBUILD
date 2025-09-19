# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.10.3
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.10.3/opencode-linux-arm64.zip")
sha256sums_aarch64=('0d6fafe9a57b22cdddf471da5f2e483656fbc4d7c1fabc20d703720eb853d62e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.10.3/opencode-linux-x64.zip")
sha256sums_x86_64=('4214c2a3bd94f6fab99a06f16af3d1abd3415b744e76ac40b565e474f851570e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
