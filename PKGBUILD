# Maintainer: Steven Noonan <steven@uplinklabs.net>
# Contributor: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>

pkgname=dropbox-kde-systray-icons
pkgver=3
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
source=('https://dl.opendesktop.org/api/files/download/id/1466612163/s/a69314ed4e57713e653eafb0b56adc00/t/1536177224/u//141519-dropbox-icons.tar.gz')
md5sums=('d4ec417f3906e99f3deef704b38718ae')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/icons/hicolor/16x16/status
  cp -r dropboxstatus-* ${pkgdir}/usr/share/icons/hicolor/16x16/status
}
