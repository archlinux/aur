# Maintainer: Steven Noonan <steven@uplinklabs.net>
# Contributor: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>

pkgname=dropbox-kde-systray-icons
pkgver=4
pkgrel=1
pkgdesc="Dropbox systray icons that fit better in KDE"
install=dropbox-kde.install
arch=('any')
url="https://www.opendesktop.org/c/1466612163"
license=('GPL')
depends=('hicolor-icon-theme' 'dropbox')
makedepends=()
provides=()
conflicts=('dropbox-faenza-light' 'dropbox-humanity-dark-icons' 'dropbox-dark-panel-icons'
'dropbox-humanity-icons' 'dropbox-light-panel-icons' 'dropbox-ubuntu-mono-light'
'dropbox-ubuntu-mono-dark' 'dropbox-faenza-dark')
source=('141519-dropbox-icons.tar.gz::https://github.com/opes/dropbox-kde-systray-icons/raw/master/141519-dropbox-icons.tar.gz')
md5sums=('d4ec417f3906e99f3deef704b38718ae')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/icons/hicolor/16x16/status
  cp -r dropboxstatus-* ${pkgdir}/usr/share/icons/hicolor/16x16/status
}
