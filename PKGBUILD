# Maintainer: GI Jack <iamjacksemail@hackermail.com>

# These are bits of odds, ends, and "hacks" for oracle java to obtain feature
# parity with the openjre packaged by Arch. The main reason for this is no
# .desktop entry for javaws so oracle's jre as shipped cannot launch java
# webapps from the browser.

pkgname=oracle-java-extras
pkgver=2
pkgrel=1
pkgdesc="System Entries and intergration for Oracle Java"
arch=('any')
url="http://aur.archlinux.org"
license=('WTFPL')
depends=('jre')
source=("jre_weblaunch.desktop")
sha256sums=('b3d533e683fe5f8de3eb16f494334111d1a7beb417563416c8c1ab9331752af1')
package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/applications/jre_weblaunch.desktop"
  install -m644 "jre_weblaunch.desktop" "${pkgdir}/usr/share/applications/jre_weblaunch.desktop"
}

