# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.58
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
sha256sums_aarch64=('9fea1c2b7bb737ba0e88afb8675a11ef83abdc03de60c82411fb7c0c2edff4af')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('867928793da67146eec0ea98b28e56cd12df52e84195d6d4c4e78a5e393200bf')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
