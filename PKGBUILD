# Maintainer: GregoD <grego.dadone@gmail.com>
# Contributor: GregoD <grego.dadone@gmail.com>

pkgname=amor-themes-extra
pkgver=1.0
pkgrel=1
pkgdesc="18 extra themes for AMOR"
arch=('any')
url="https://projects.kde.org/projects/kde/kdetoys/amor"
license=('GPL')
depends=('amor')
source=('https://www.dropbox.com/s/f3ab5b11zoa4q5g/amor-themes-${pkgver}-${pkgrel}.tar.gz')
sha256sums=('d2407274bfbf54d9e01a0665bcc2626f9eac35a164fc23ae0d19cc1a9ad5e04d')
install='amor-themes-extra.install'

package() {
  mkdir -p "${pkgdir}/usr/share/apps/amor"
  cp -R "${srcdir}/pics" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/BBrc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/kdragonrc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/opensuse-friendlyrc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/sakurarc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/vaderrc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/bcarrc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/laracroftrc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/sexiladyrc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/wolverrc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/bigryurc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/mariorc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/pimprc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/smallryurc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/ycarrc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/heli-kderc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/misatoblirc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/reirc" "${pkgdir}/usr/share/apps/amor"
  cp "${srcdir}/Snowmanrc" "${pkgdir}/usr/share/apps/amor"
}