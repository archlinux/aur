# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.6
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
sha256sums_aarch64=('4d5c382101ddb7eccba14ea87aa11bdf1e4c304a9fc4d6078891a8c2aa0f64fb')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('6dc0973e96167c005774415616a2da79424abdca8481c97482d3bdd2240521a9')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
