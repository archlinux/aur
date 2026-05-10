# Maintainer: Anonymous <anonymous@archlinux.org>
pkgname=muhtar-organizer
pkgver=1.0.0
pkgrel=1
pkgdesc="A powerful storage manager and file organizer, powered by Muhtar-Dil."
arch=('any')
url="https://github.com/KaliciArkadas/muhtar-organizer"
license=('MIT')
depends=('python')
# Not: Eğer sadece organizatör ise python yeterli,
# ama downloader özelliklerini de ekleyeceksen yt-dlp ve mpv kalsın.
source=("organizer.muh::https://raw.githubusercontent.com/KaliciArkadas/muhtar-organizer/main/organizer.muh")
sha256sums=('SKIP')

package() {
    # 'organizer.muh' dosyasını sistemde 'muhtar-organizer' komutuyla çalışacak şekilde ayarlar
    install -Dm755 "${srcdir}/organizer.muh" "${pkgdir}/usr/bin/${pkgname}"
}
