# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.116
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
sha256sums_aarch64=('3727b3a19ce8bd9aaaa9dba5891b9245f0f3be92cdec3cf2e7301dda7dd5407a')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('f3798e3ff79697ef41ff2a85a19ffbbd5a012cdbe3102298023020f76a06d1ac')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
