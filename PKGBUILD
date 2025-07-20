# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.41
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.41/opencode-linux-arm64.zip")
sha256sums_aarch64=('6d6e583b65f4aaf1d2e3635e55d50e172fe14e6f387e7f79671bd8fcdaf7c29c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.41/opencode-linux-x64.zip")
sha256sums_x86_64=('da2919d68c9fc89ea8564639ac2ac182270079e085713cc98e4a1dccbd067c71')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
