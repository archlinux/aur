# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.34
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/anomalyco/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('1fb922a353b604d5dfe00229f1ff01b0eca63e77367b9e7ec8f5f33ddcf87cb0')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('1740a127e80e56f6db35482ae7ac855441c8d11f6bdbfe949063e45360b34023')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
