# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.11
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
sha256sums_aarch64=('d50dee7d7d9a47898932773bf3c87e038fc316c501472bd9046d6aa83959cdd6')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('1e0c884ce6801c19570520f9fd71465356054b12d32fb36414e34b12abfd39be')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
