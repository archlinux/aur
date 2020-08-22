# Maintainer Filip Parag <aur@filiparag.com>

pkgbase=wikiman
pkgname=wikiman
pkgver=1
pkgrel=1
pkgdesc="Browse ArchWiki and manual pages from your terminal"
url="https://github.com/filiparag/wikiman"
license=('MIT')
source=('git+https://github.com/filiparag/wikiman.git')
arch=('any')
sha1sums=('SKIP')
makedepends=('git')
depends=(man arch-wiki-docs links fzf ripgrep awk)

package() {
  cd "${pkgname}"
  install -Dm 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}