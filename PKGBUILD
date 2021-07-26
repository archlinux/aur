# Maintainer: Minmo <com dot gmail at maroboromike>

pkgname=yt-dlp-drop-in
pkgver=1
pkgrel=1
pkgdesc='Emulate youtube-dl executables with yt-dlp (youtube-dlp)'
arch=('any')
license=('MIT')
depends=('yt-dlp')
provides=('youtube-dl')
conflicts=('youtube-dl')

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s 'yt-dlp' "${pkgdir}/usr/bin/youtube-dl"
}
