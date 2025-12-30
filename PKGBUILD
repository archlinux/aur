# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.215
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
sha256sums_aarch64=('ed24f0e5370e9d621e9f22ef54eb3dc5cd0a65e41e277eba7f300be87f233db9')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('5291501f7ba8809995ddc6b6509d834a876089ae00d9254d47e92ff25f9b4e66')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
