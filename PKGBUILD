# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.48
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.48/opencode-linux-arm64.zip")
sha256sums_aarch64=('a7a2e810a94938657c525530ffcf1201abb680c01480802c067450a4b422fc09')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.48/opencode-linux-x64.zip")
sha256sums_x86_64=('74b66860c8481dcde677ad7bd935ad3cf69235a2529e865b2ce420683ad193f5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
