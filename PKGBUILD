# Maintainer: Adria Arrufat <swiftscythe@gmail.com>

pkgname=dropbox-kde-systray-icons
pkgver=1
pkgrel=1
pkgdesc="Dropbox systray icons that fit better in KDE 4"
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
source=('http://cccliparts.org/CONTENT/content-files/141519-dropbox-icons.tar.gz')
md5sums=('d4ec417f3906e99f3deef704b38718ae')
build() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/icons/hicolor/16x16/status
  cp -r dropboxstatus-* ${pkgdir}/usr/share/icons/hicolor/16x16/status
}
