# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=zaman
pkgver=1.0.1
pkgrel=1
pkgdesc="Print man pages in a PDF file (with vim keys support) for an easier reading"
arch=('any')
url="https://github.com/Antiz96/zaman"
license=('GPL3')
depends=('zathura' 'zathura-pdf-poppler' 'dmenu')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=(3901380fe67666c5178434894219f64d4af33e2a088a8adba339d0b778f7fdf6)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm 755 "src/bin/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm 644 "src/man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
