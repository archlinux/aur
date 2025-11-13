# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.63
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
sha256sums_aarch64=('7117706de14fba4540e650affc4638b9ac16678192d07f6b9257c282d1106345')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('edefa5571aeda17f631869f440ec95dcaf56360b471e7152b26e2d6b9672b0dd')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
