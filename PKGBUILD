# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.48
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
sha256sums_aarch64=('eae1c6c3c8c63d7fef6e620bd751d25ced8c56d7b4f820676d4ac7031dba40bc')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('267a192bbdce50fadc7e81289167cefd29f78e7d1a5ce51d7182606d47dd14ae')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
