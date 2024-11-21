# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=yt-dlp-rtp
pkgver=2024.09.26
pkgrel=1
pkgdesc="yt-dlp build with fixes to make it work on RTP Play"
arch=('x86_64')
url="https://forum.zwame.pt/threads/download-videos-rtp.964274/post-16943848"
license=('Unlicense')
provides=('yt-dlp-rtp')
conflicts=('yt-dlp-rtp')
source=("$pkgname::https://cld.pt/dl/download/2653af91-88cc-433a-9144-957d8e31f51d/yt-dlp-rtp-support_linux")
sha256sums=('42b81a5af55224691e249146629fd2f82129e3e615c9e1e4aaca60c826200b01')

package() {
	install -Dm755 "./$pkgname" "${pkgdir}/usr/bin/$pkgname"
}
