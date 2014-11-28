# Contributor: Jaroslav Lichtblau <tu@dragonlord.cz>

pkgname=diff2colorhtml
pkgver=0.1
pkgrel=1
pkgdesc="Convert diff output to colorized HTML."
arch=('i686' 'x86_64')
url="http://www.linuxjournal.com/content/convert-diff-output-colorized-html"
license=('unknown')
depends=('diffutils')
source=($pkgname.sh)

md5sums=('852ce6053240efa56aeaa4ac0cd58323')

build() {
  cd "${srcdir}"
  install -D -m755 "$pkgname.sh" "${pkgdir}/usr/bin/$pkgname"
}
