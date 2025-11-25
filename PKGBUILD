# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.112
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
sha256sums_aarch64=('0cbc04057646818aac48c9521ea631e372b72ac1b9faf2001de33e0a346be8f9')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('6a9eaa8c7da3b20c03200e32d61e37c60469a5796c3cfb75389d451a12573092')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
