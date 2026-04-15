# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.2.8
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
sha256sums_aarch64=('ad951d7471e5bcfb1e3de4ceeab4c770f1a6833ea31a06a8b2c91c7310527804')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('ff426c7a185406f7e1a02c2793188d708e2fdc2777c02f5ee5aadac1b6ff08c0')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
