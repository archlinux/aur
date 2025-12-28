# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.205
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
sha256sums_aarch64=('a2032b585d980bd305b4e9864ee059dc63ed7f97ec07866a5d8fc20b8055636e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ce0af6e5219da0d22c5587e1f712c2776441e5d2844e71494883c357f573b377')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
