# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.103
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.103/opencode-linux-arm64.zip")
sha256sums_aarch64=('24121d97ac9844280d1b63d1508d2703c58c17457c68d79b68937220df8ae7d5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.103/opencode-linux-x64.zip")
sha256sums_x86_64=('10eb097779274a960e106f1af894376629e954f50cea38e5811753dca0e7ecb5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
