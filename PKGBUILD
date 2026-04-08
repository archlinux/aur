# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.2.1
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
sha256sums_aarch64=('24aa60d5ddc4e1f46b7f53f32c52a32fe9bebdf2c074500844e177fd1135f2ee')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('c1c0f777dcf3682beb0896d02c26f026017b3887f168710932405e7c9459759f')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
