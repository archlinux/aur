# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.6
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
sha256sums_aarch64=('e998adb353bae487937f0579fdf752e1e33ee7f5c0185ff232686810d68944ce')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('4e3dee6eabc69bcce08bd1c0adb72c35875529531d1c0b58293dda8128e2182c')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
