# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.2.11
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.11/opencode-linux-arm64.zip")
sha256sums_aarch64=('201b4661538ff2a93709c27e27aeefdd8ccb4ca4838027f51e6b297cdc1d4311')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.11/opencode-linux-x64.zip")
sha256sums_x86_64=('7eeeac7c4b1c2f25c77f3325cd226f256dde377300c759b1e28920c0a8518949')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
