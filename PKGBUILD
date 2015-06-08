# Maintainer: Evgeniy "arcanis" Alexeev <arcanis.arch at gmail dot com>

pkgname=kdeplasma-applets-plasmacon
_pkgname=Plasmacon
pkgver=0.3
pkgrel=1
pkgdesc="A terminal emulator based on KDE Konsole technology"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=108120"
license=('GPL')
depends=('kdebase-konsole' 'kdebase-workspace' 'kdebindings-python2')
source=(http://kde-look.org/CONTENT/content-files/108120-plasmacon.plasmoid)
install=${pkgname}.install
md5sums=('d652cb493f90d1f6f9b2271e5f3eef63')

package() {
  install -dm755 "${pkgdir}/usr/share/apps/plasma/plasmoids/${_pkgname}/contents/code"
  install -m644 "${srcdir}/contents/code/"* -t "${pkgdir}/usr/share/apps/plasma/plasmoids/${_pkgname}/contents/code"
  install -Dm644 "${srcdir}/metadata.desktop" "${pkgdir}/usr/share/apps/plasma/plasmoids/${_pkgname}/metadata.desktop"
  install -Dm644 "${srcdir}/metadata.desktop" "${pkgdir}/usr/share/kde4/services/${_pkgname}.desktop"
}
