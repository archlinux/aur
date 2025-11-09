# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.51
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
sha256sums_aarch64=('28cb67ebb4c1681b6519e7f80582bb740f42a351fe490a09a7180dd968bc69bb')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('fdbb9d7542724a90a998c30095f74c3477736d1fec030ce401f69ac7351f896a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
