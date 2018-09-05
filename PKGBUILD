# Maintainer: Steven Noonan <steven@uplinklabs.net>
# Contributor: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>

pkgname=dropbox-kde-systray-icons
pkgver=2
pkgrel=1
pkgdesc="Dropbox systray icons that fit better in KDE"
install=dropbox-kde.install
arch=('any')
url="http://kde-look.org/content/show.php?content=141519"
license=('GPL')
depends=('hicolor-icon-theme' 'dropbox')
makedepends=()
provides=()
conflicts=('dropbox-faenza-light' 'dropbox-humanity-dark-icons' 'dropbox-dark-panel-icons'
'dropbox-humanity-icons' 'dropbox-light-panel-icons' 'dropbox-ubuntu-mono-light'
'dropbox-ubuntu-mono-dark' 'dropbox-faenza-dark')
source=('https://dl.opendesktop.org/api/files/download/id/1466612163/141519-dropbox-icons.tar.gz')
md5sums=('02cb93bb0570b564e174a78f7c2be490')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/icons/hicolor/16x16/status
  cp -r dropboxstatus-* ${pkgdir}/usr/share/icons/hicolor/16x16/status
}
