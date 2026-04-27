# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.2.25
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
sha256sums_aarch64=('141c528795423142ceb049732ba0bd92fc94712808fc2b066e13c1057e92e8c3')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('84fd0f71ff2680d6477c5bb768dc1097afecfeb1298c1b4392a36dc2d35c1602')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
