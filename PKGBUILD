# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.16
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
sha256sums_aarch64=('b9b229be5cfbe14d87f4785ff07ed1843f072b8f55e1a2852d8c676960670165')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('289e9041ee958550c6fcd9310585c8095eed599da2ad12a55e5446ae8263ff59')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
