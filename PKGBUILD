# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.3.1
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
sha256sums_aarch64=('147aafb035912021678da0f1efe80ed0c3988efe0c0022876d25f0bcd77f3fbf')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('5ed0af6c77371cc5a977d79b1b83ebe4f4d17349494b0b8e1200297c32f963cd')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
