# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.15
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
sha256sums_aarch64=('c68fbc537c716fc6e97d8e01b63c23c2f17278934c3267ac14252e89b78b269e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('d5df7e0c43d257904eaa4c3188ca5e983df6568a0f035c0274941fae3a5a95ad')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
