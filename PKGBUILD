# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.2
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
sha256sums_aarch64=('051c00ef2ea884267dab906ce035cb349fcb574c7cdd486e0d6e2c8d108ab859')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('3aca969390542070a35b4a6657ea3d1d076b5d0460625c5f3555ea09a9ac7df5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
