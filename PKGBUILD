# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.95
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.95/opencode-linux-arm64.zip")
sha256sums_aarch64=('366f0ee2892919a5a78231fa23a2c8ecb323a33099dd5b158a11cdbc2336e7b0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.95/opencode-linux-x64.zip")
sha256sums_x86_64=('c201c0ee939eb6d42ef9b93e1cffd3e307cbdd0e2b87232a0efa6f512a4a9ec3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
