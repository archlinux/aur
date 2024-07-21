# Maintainer: Bryn Miller <bryn@brynmiller.me>
pkgname="bynfont"
pkgver=1.0.0
pkgrel=2
pkgdesc="A bitmap font for Linux console that combines other fonts' best features."
arch=("any")
url="https://github.com/bynux-gh/bynfont"
license=('MIT')
depends=()
makedepends=()
optdepends=()
source=("git+${url}.git")
md5sums=("SKIP")

package() {
  cd "${pkgname}"
  mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
  install -Dm 644 bynfont.psfu.gz -t "${pkgdir}"/usr/share/kbd/consolefonts/
}
