# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gimp-plugin-pandora
pkgver=0.9.3
pkgrel=2
pkgdesc="A GIMP plug-in which helps in stitching together multiple images to make a panorama"
arch=('any')
license=('GPL')
url="http://www.shallowsky.com/software/pandora/"
depends=('gimp')
source=(http://www.shallowsky.com/software/pandora/pandora-combine-${pkgver}.scm)
sha256sums=('603041ad27da450a58898b70b0b664a7f0d052ac36fde2aa58f4ea86922acf21')

package() {
  cd "${srcdir}"

  install -Dm644 pandora-combine-$pkgver.scm "${pkgdir}"/usr/share/gimp/2.0/scripts/pandora.scm
}
