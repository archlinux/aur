pkgname=dropbox-kfilebox-icons
pkgver=1
pkgrel=1
pkgdesc="Dropbox systray icons from the Kfilebox program"
arch=('any')
url="http://i.imgur.com/ZQNQM.png"
license=('GPL')
depends=('hicolor-icon-theme' 'dropbox')
conflicts=('dropbox-dark-panel-icons'
           'dropbox-humanity-dark-icons'
           'dropbox-humanity-emblems'
           'dropbox-humanity-icons'
           'dropbox-kde-systray-icons'
           'dropbox-light-panel-icons'
           'dropbox-tango-emblems'
           'dropbox-ubuntu-mono-dark'
           'dropbox-ubuntu-mono-light'
           'dropbox-faenza-dark'
           'dropbox-white-icons')
source=("https://dl.dropbox.com/u/6596386/${pkgname}/${pkgname}.tar.gz")
md5sums=('408a9440ff4d4ca23150ec5bc6cd0265')
install="dropbox-kfilebox-icons.install"

package(){
  install -d "${pkgdir}/usr/share/icons/hicolor/16x16/status"
  cp -r dropboxstatus-* "${pkgdir}/usr/share/icons/hicolor/16x16/status"
}
