# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.10
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
sha256sums_aarch64=('fd7d5ec204c2488f4dc2e69a3218420ef2b2cd6e2ab6c7ebb0e3f7c6527a8713')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('ec23105a10794946c29f02d093afff2ee7006abd8f1937d3c725fd8bba6bdbbd')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
