# Maintainer Filip Parag <aur@filiparag.com>

pkgbase=wikiman
pkgname=wikiman
pkgver=1.0
pkgrel=2
pkgdesc="Browse ArchWiki and manual pages from your terminal"
url="https://github.com/filiparag/wikiman"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/filiparag/wikiman/archive/${pkgver}.tar.gz")
arch=('any')
sha1sums=('SKIP')
depends=(man arch-wiki-docs links fzf ripgrep awk)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}