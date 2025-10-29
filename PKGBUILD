# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.25
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('75745fc1d472f94b2e0fecb400e55b03d001d08f07076ddcfd72e82f03410901')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('54876523374badc2b5e9c906642add1e51de18bbbc18f0be4623157715bd55e9')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
