# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.10
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/anomalyco/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('d9a9d4f0bc1ed246258c0e8846e80593755a72bf4afd3940c4071d6f0b7b7775')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ebcc24012e8f067b10d7416430c88e9c429115ecfbccf8da9eb59db3b629a358')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
