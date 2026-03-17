# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.48
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
sha256sums_aarch64=('67099a7e591656169c223245eea65a7c42827eddfdf1fe6d9064391ac6fd8956')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('24202027374c1dd4c1c6b10e075a5818b459e95b079cc93f0a842b1f73f6a6fc')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
