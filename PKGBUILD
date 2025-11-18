# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.72
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
sha256sums_aarch64=('5f9b21d854ac0e76dfd521f111836f2af9ad737bd19e74cd75ef5b485e2dd854')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('76ea03397593490537d217b059618023aab508434ffe7226a9fbd428fd854a10')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
