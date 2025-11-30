# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.122
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
sha256sums_aarch64=('1b75d059ee58fff6474830c36ad1ef6581caa8dd4435174113404c67c78fd0a7')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('0e97ccee701622bdd376d4939a34f7e3daea775bd9a659b43cc81384c6f997e2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
