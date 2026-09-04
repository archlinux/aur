# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.28
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
sha256sums_aarch64=('ccb0d39467eeccc52cdfe1cccad0114304366cb42073b906d970a487ca5b4497')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('42add0fb1f13bdfd13855adc11cdaf2944c149377a873732168cdfd234fec7c3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
