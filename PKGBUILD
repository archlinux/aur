# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.8
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/Kilo-Org/kilocode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('kilo')
conflicts=('kilo')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-arm64.tar.gz")
sha256sums_aarch64=('f9f749ac4524094147f38f357c9fe15bf51e19f0dca28d06357cba2faa32aeea')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('9298bb4816e34503884e11483ff01ff16614b235932a18c95d736562edf2be78')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
