# Maintainer:  (dreieck https://aur.archlinux.org/account/dreieck)
# Contributor: Adria Arrufat
# Contributor: swiftcythe (https://aur.archlinux.org/account/swiftscythe)

pkgname='latextogrob'
pkgver=0.2
pkgrel=2
pkgdesc="A simple script to convert a file with LaTeX formulae into a readable file with HP 48/50g"
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?id=117953"
license=("GPL2")
depends=(
  'bash'
  'imagemagick'
  'mathtex'
  'netpbm'
  'pgmtogrob'
)
source=(
  'latextogrob'
)
sha256sums=(
  '458713f368cd6b4ba0b6081f338aaa75dc61cb0b8f9a725d1b292d1bb5f1fb3a'
)

package() {
  cd "${srcdir}"

  install -Dvm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
