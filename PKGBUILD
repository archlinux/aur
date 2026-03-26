# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.7
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
sha256sums_aarch64=('c85ae1cac6a3c2af83b641ea8f57661adbac59e62051ada8a86783f63fe439e1')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('642572ebcb4a7c9511c08323b931ffb7c9c4016c1b39ce1fcb0ed6c8f5b4b8dd')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
