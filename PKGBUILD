# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.36
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.36/opencode-linux-arm64.zip")
sha256sums_aarch64=('7c502784a36a23d8ef378f30f18dae6074f43d94a444e8d038f754082202453a')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.36/opencode-linux-x64.zip")
sha256sums_x86_64=('52bb7cd34006c6804ad2fe92e38a7a030547b2853593eb14ca18ea511ed7b89d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
