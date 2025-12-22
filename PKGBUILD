# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.190
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
sha256sums_aarch64=('0e4a3d32676a8adeed76cdb0df11f4d1648cc9a41f319cd07098c54c481e7093')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('a8e1c3d55745a063cecf5175a8a081ae71421ef780448ec4fa2fd73658ec7cdf')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
