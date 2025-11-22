# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.105
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

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('3f4c9550f6dc47bce16fe75ac5fe6978e0c7cdc08a95c571e37404c3012e2193')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('035aa15742407b8e35dd82f5997dcdaf680dc846b82149a626ebc6b8a33c837a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
