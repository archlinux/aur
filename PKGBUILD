# Maintainer: Firegem <mrfiregem [at] protonmail.ch>
pkgname=arturo-bin
_pkgname=${pkgname%-bin}
pkgver=0.9.83
pkgrel=1
pkgdesc='Simple, expressive & portable programming language for efficient scripting.'
arch=('x86_64')
url='https://arturo-lang.io/'
_url='https://github.com/arturo-lang/arturo'
license=('MIT')
depends=('glib2' 'gmp' 'gtk3' 'webkit2gtk')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-full-x86_64-linux.tar.gz")
sha256sums=('70fc6debbdc2e77b291c8a2caafd6263bb29f7c61594522a1b2da75c02c52362')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" arturo
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" README.md
}
