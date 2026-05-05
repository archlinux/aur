# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.2.40
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
sha256sums_aarch64=('9033a5939a59e58ec7ab19cd5e5141b81d1b964141557541c3ade3121ee855e4')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('b5e291b5e7b270bf10e97d1c03d77432ef2a97331127428c314c88c97bf7a9f3')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
