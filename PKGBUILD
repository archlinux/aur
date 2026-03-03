# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.36
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
sha256sums_aarch64=('e7147c805cc84ab8c4be3a755e60997a0e448058ea473aecd6c88d4f7c828790')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('39d39c70544f7431c2669074f79748c261ed39c1347392407dc288c7601e531d')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
