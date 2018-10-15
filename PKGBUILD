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
source=('141519-dropbox-icons.tar.gz::https://www.opendesktop.org/p/1120552/startdownload?file_id=1466612163&file_name=141519-dropbox-icons.tar.gz&file_type=application/x-gzip&file_size=18476&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownload%2Fid%2F1466612163%2Fs%2Ff763476992459b2748b0975b032dc7d2%2Ft%2F1539636032%2Fu%2F%2F141519-dropbox-icons.tar.gz')
md5sums=('d4ec417f3906e99f3deef704b38718ae')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/icons/hicolor/16x16/status
  cp -r dropboxstatus-* ${pkgdir}/usr/share/icons/hicolor/16x16/status
}
