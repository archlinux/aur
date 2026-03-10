# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.41
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
sha256sums_aarch64=('c29a6221045847926e634c25526132fad6cac81b4ec05c78df57d7a29e5b1470')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('8ce26d4c1d4ea262e7d2fb91c06a509850761b1fc77447c8d5a79c4cf16d2778')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
