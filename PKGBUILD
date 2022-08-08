# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=zaman
pkgver=1.0.0
pkgrel=1
pkgdesc="Print man pages in a PDF file (with vim keys support) for an easier reading"
arch=('any')
url="https://github.com/Antiz96/zaman"
license=('GPL3')
depends=('zathura' 'zathura-pdf-poppler' 'dmenu')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=(c689ec4886aea672a38d61c69edd88a195a10fbffdbc6d6f0ffaa48994fddb53)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm 755 "src/bin/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm 644 "src/man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
