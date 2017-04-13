# Maintainer: GI Jack <iamjacksemail@hackermail.com>

# These are bits of odds, ends, and "hacks" for oracle java to obtain feature
# parity with the openjre packaged by Arch. The main reason for this is no
# .desktop entry for javaws so oracle's jre as shipped cannot launch java
# webapps from the browser.

pkgname=oracle-java-extras
pkgver=1
pkgrel=2
pkgdesc="System Entries and intergration for Oracle Java"
arch=('any')
url="http://aur.archlinux.org"
license=('WTFPL')
depends=('jre')
source=("jre_weblaunch.desktop")
sha256sums=('677a7c574f65ce631070166a8ca53937849815ab88b7c28bc0c5fe604c8bdc9c')
package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/applications/jre_weblaunch.desktop"
  install -m644 "jre_weblaunch.desktop" "${pkgdir}/usr/share/applications/jre_weblaunch.desktop"
}

