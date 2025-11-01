# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.7
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
sha256sums_aarch64=('a6567e9a5a045229d1fc3ab33bdc676a9d48aadac25bf268319a4a0703c5fa9e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('bf90306248d12fe2a470e7d452e5e78ae6a67e5f082b2e4a7abd276d51b43ff6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
