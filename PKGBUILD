# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.69
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
sha256sums_aarch64=('caa0aab43fd81a9ab1b7d33dc76a6947691ab5a78c1a08ba34071d1ba884f74b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('88130b90b61dbfc13874a5f65965501b4a5ce31334d130edb88518012042dc10')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
