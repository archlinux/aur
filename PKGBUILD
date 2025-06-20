# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.108
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.108/opencode-linux-arm64.zip")
sha256sums_aarch64=('3c0a3044197f816b36964a5c2df2b63f8fe9f5a03fd2999249b83ed8d4105e08')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.108/opencode-linux-x64.zip")
sha256sums_x86_64=('bbd16ade0c59950eb341ac973b962b330f2708cfd70e0bb7407c053002e47178')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
