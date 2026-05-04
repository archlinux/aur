# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.2.34
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
sha256sums_aarch64=('d5e7966638c6f8e962adb735cc459a161842004c99ae22d19797b4ef3f93906d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('e35f1bd7856ae0f22108ed2ad6e0ed595267ae335d55c533cd3c9ec3267fa2fb')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
