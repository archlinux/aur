# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.79
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
sha256sums_aarch64=('258077c23bedbbd13ac3f2162ea52ff8babb729438d04cab70f88d44d12e8387')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('1b3fda2aee3618d1ff0323eb5e6e9dd0dbc94ddc306de65adef4ff2ba97db511')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
