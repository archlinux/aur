# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.37
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
sha256sums_aarch64=('25b17e610beb75fd00c4f1220bca489fd7824a77844b37947aba96195c634068')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('d6c8928b772a03854b0fc0247bb17ab2b597abbba71c834e79ab2b304116746d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
