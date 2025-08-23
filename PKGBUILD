# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.5.18
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.5.18/opencode-linux-arm64.zip")
sha256sums_aarch64=('47f0617ce8120b4206d6f93d06df60b3d995d3830c70599abd3f6046995c6fbd')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.5.18/opencode-linux-x64.zip")
sha256sums_x86_64=('c4363a9a48f1cffa3d556e9ded1c90545540a4738ef60cc1fd9db11e716c7106')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
