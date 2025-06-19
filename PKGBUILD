# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.93
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.93/opencode-linux-arm64.zip")
sha256sums_aarch64=('fd6b8753c92a7ce73b94f9b42f2676d8406322969a80455f08a0ce314a30afb2')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.93/opencode-linux-x64.zip")
sha256sums_x86_64=('a76340f69230217cd62b776c50575ea68639f0b26aad4d3bda7df620a1311e53')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
