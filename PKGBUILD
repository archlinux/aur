# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.46
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
sha256sums_aarch64=('eb35ea4a7c777882bcf9d911ee9c8f25e6a4227bbdeda910aa2471deacf3291a')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('19d80c40396930e96afe3f63000bc28d9094760daa16c7b1d7e76dc999cfebcb')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
