# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.1
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
sha256sums_aarch64=('19ed85a19ebfab2eae34eed8eee1f9e1198281c1d75c7b75feea1083775e9834')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('831818d2779df8faa64ebca09af7b43779f9b692af223896d782e73069362125')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
