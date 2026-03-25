# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.4
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
sha256sums_aarch64=('fb1827c9b67d82c2fbc786964be88402179a39708089bb212dcf15782959b997')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('a904b2b17412454448bbf8cf2f99ebe7e29183acd0853e4e717d6378235d4d8d')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
