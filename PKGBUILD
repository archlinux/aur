# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.220
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('540af2638ba5fdff406cb5cb506ce4138a570daff20d4fc266d1fd54596d0237')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('35d03ce64417f067473ff76e93e0769741e407a9087fffbe18d46b8557ae01e5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
