# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.45
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
sha256sums_aarch64=('e3885c315a3c064e3de9f274f69e8fb622eea7693505320e2af1a9fe7de50d4e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('c15da42bffa600d4f5e9669f47dcb32b2f5ed3c7433c1761f0c95723dae677ae')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
