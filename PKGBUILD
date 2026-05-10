# Maintainer: Anonymous <anonymous@archlinux.org>
pkgname=muhtar-downloader
pkgver=1.0.0
pkgrel=1
pkgdesc="A powerful YouTube downloader and streamer with storage management, powered by Muhtar-Dil."
arch=('any')
url="https://github.com/KaliciArkadas/muhtar-downloader"
license=('GPL')
depends=('python' 'yt-dlp' 'mpv') # yt-dlp ve mpv olmazsa olmaz kanka!
source=("${pkgname}::https://raw.githubusercontent.com/KaliciArkadas/muhtar-downloader/main/muhtar_downloader.py")
sha256sums=('SKIP')

package() {
    # /usr/bin altına 'muhtar-downloader' adıyla yüklüyoruz
    # Böylece terminale bu ismi yazınca otomatik açılacak
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
