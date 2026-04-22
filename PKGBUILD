# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.2.18
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
sha256sums_aarch64=('958b3822e426d098d79d9ea238ca3e2280bbe9b82621350a5de4373abf8103b2')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('49c3f261d9540226f07bef053ce37a06bfa89712785053cdcd783512398e5de4')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
