# Maintainer: Firegem <mrfiregem [at] protonmail.ch>
pkgname=arturo-bin
_pkgname=${pkgname%-bin}
pkgver=0.9.78
pkgrel=1
pkgdesc='Simple, expressive & portable programming language for efficient scripting.'
arch=('x86_64')
url='https://arturo-lang.io/'
_url='https://github.com/arturo-lang/arturo'
license=('MIT')
depends=('glib2' 'gmp' 'gtk3' 'webkit2gtk')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux-full.tar.gz")
sha256sums=('6b344cd25f3413f20fc51293dc38d7e44d8d0cc1d5c0c96ee8987af3c10b35aa')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" arturo
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
