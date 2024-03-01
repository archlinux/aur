# Maintainer: dadav <33197631+dadav@users.noreply.github.com>
pkgname=go2rtc
pkgver=1.8.5
pkgrel=1
pkgdesc="Ultimate camera streaming application with support RTSP, RTMP, HTTP-FLV, WebRTC, MSE, HLS, MP4, MJPEG, HomeKit, FFmpeg, etc."
arch=('x86_64')
url="https://github.com/AlexxIT/go2rtc"
license=('MIT')
source=("https://github.com/AlexxIT/go2rtc/releases/download/v${pkgver}/go2rtc_linux_amd64")
sha256sums=('a10b03ee68e4502933eaf2c1cda871a9e5b1080fd775a85115ee6c15a5fcde1d')
options=(!strip)

package() {
	install -D -m755 "$srcdir"/go2rtc_linux_amd64 "$pkgdir/usr/bin/go2rtc"
}
