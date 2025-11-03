# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.17
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
sha256sums_aarch64=('1f5cab908b59c2b2533668ba1c5fdf7dc905e55d8d476ed9b489d3faf5369a29')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('939f22c97574b9967886260614726799c59befe4a5e068681d4fd8a46e68e052')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
