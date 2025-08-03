# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.117
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.117/opencode-linux-arm64.zip")
sha256sums_aarch64=('fd4140ffdac72be17ba45f7d7ff4d18c1fcbe06fbd546d15f34707a9d5fa46d2')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.117/opencode-linux-x64.zip")
sha256sums_x86_64=('a67b80efc7adda48d6296b57815a87177abb418b59bc67052b0e092ffbfea596')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
