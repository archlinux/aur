# Maintainer: Firegem <mrfiregem [at] protonmail.ch>
pkgname=arturo-bin
_pkgname=${pkgname%-bin}
pkgver=0.9.77
pkgrel=1
pkgdesc='Simple, expressive & portable programming language for efficient scripting.'
arch=('x86_64')
url='https://arturo-lang.io/'
_url='https://github.com/arturo-lang/arturo'
license=('MIT')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux-full.tar.gz")
sha256sums=('73a6da91dcda2657fab26c944594ebbf7134c60b1ed9077539f6c09440f582a2')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" arturo
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
