# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: dale <dale@archlinux.org>

pkgname=fortune-mod-xfiles
pkgver=0
pkgrel=3
pkgdesc="A collection of fortune cookies from X-Files"
arch=('any')
depends=('fortune-mod')
url="http://www.splitbrain.org/projects/fortunes/xfiles"
license=('unknown')
source=(http://www.splitbrain.org/_media/projects/fortunes/fortune-xfiles.tgz)
md5sums=('dfbe17a0b0b78e5914d0838852becb7b')

package() {
  cd "${srcdir}"/fortune-xfiles

  install -d "${pkgdir}"/usr/share/fortune
  cp "${srcdir}"/fortune-xfiles/xfiles* "${pkgdir}"/usr/share/fortune
  chmod 644 "${pkgdir}"/usr/share/fortune/*
}
