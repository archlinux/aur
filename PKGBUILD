pkgname=firefox-extension-video-download-helper-companion-app-bin
pkgver=1.2.4
pkgrel=1
pkgdesc='Companion app for Video DownloadHelper.'
arch=('x86_64')
url='https://www.downloadhelper.net/install-coapp'
license=('GPL2')
depends=('sdl2')
provides=('firefox-extension-video-download-helper-companion-app')
source=("https://github.com/mi-g/vdhcoapp/releases/download/v${pkgver}/net.downloadhelper.coapp-${pkgver}-1_amd64.deb")
sha256sums=('36306d53b5258cb1a588ddec73851208398c8d3f5d8c6389d45a9cbb0493e383')

package() {
  cd "${srcdir}"
  tar -xf data.tar.gz -C "${pkgdir}"
}
