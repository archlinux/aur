# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.2.20
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
sha256sums_aarch64=('706ae5cc937b0a670ed93a6acc675fd291e57ce464fdb55033860e8f4009fa42')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('71eca4603dad6f0ef5cbad299bd48f63eb8d7fda27084577f0057e6a4c693f32')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
