# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.31
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.31/opencode-linux-arm64.zip")
sha256sums_aarch64=('449f138d30484e46d1e69b789f6aa3f378263af87589356080fda784d01ff860')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.31/opencode-linux-x64.zip")
sha256sums_x86_64=('d6ea90b40e64544aa238db2332748db7668f1ef4c03356ea454d4cecfa496be5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
