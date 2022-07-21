# Maintainer: Grego Dadone <grego.dadone@gmail.com>
# Contributor: Grego Dadone <grego.dadone@gmail.com>

pkgname=amor-themes-extra
pkgver=1.0
pkgrel=2
pkgdesc="26 extra themes for KDE AMOR"
arch=('any')
url="https://github.com/gregodadone/amor-themes-extra"
license=('GPL')
depends=('amor')
source=(https://github.com/gregodadone/amor-themes-extra/releases/download/aur/amor-themes-extra-1.0-2.tar.gz)
sha256sums=('74528e8c33c4f665fe54d2510ebd3f57613108d71c9c15e928a6cf53bda5a0e9')
install='amor-themes-extra.install'

package() {
  mkdir -p "${pkgdir}/usr/share/amor"
  cp -R "${srcdir}/amor/pics" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/baconrc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/BBrc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/bcarrc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/bigryurc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/bsdarc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/chenrc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/dogrc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/edrc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/heli-kderc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/kdragonrc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/laracroftrc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/mariorc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/misatoblirc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/opensuse-friendlyrc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/pimprc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/pyramidheadrc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/reirc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/sakurarc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/sexiladyrc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/smallryurc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/Snowmanrc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/tomoyorc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/torarc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/vaderrc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/wolverrc" "${pkgdir}/usr/share/amor"
  cp "${srcdir}/amor/ycarrc" "${pkgdir}/usr/share/amor"
}
