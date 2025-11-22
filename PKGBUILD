# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.90
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
sha256sums_aarch64=('86f39b30689c484430ae471cb4f56f7fead9f01c1614a38db877026a25d2e393')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('8c440e7e87847f479b22dbc7eabb6ad715f78e8bda4bc951f5dc69283099ec72')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
