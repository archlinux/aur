# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=diff2colorhtml
pkgver=0.1
pkgrel=1
pkgdesc="Convert diff output to colorized HTML"
arch=('any')
url="http://www.linuxjournal.com/content/convert-diff-output-colorized-html"
license=('unknown')
depends=('diffutils')
source=($pkgname.sh)
md5sums=('852ce6053240efa56aeaa4ac0cd58323')

package() {
  cd "${srcdir}"

  install -D -m755 $pkgname.sh "${pkgdir}"/usr/bin/$pkgname
}
