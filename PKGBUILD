# Maintainer: Colzry <colzry@foxmail.com>

pkgname=m3u8downloader-colzry-bin
_pkgname=m3u8downloader
pkgver=1.2.6
pkgrel=1
pkgdesc="A concise m3u8 video downloader / 一款简洁的 m3u8 视频下载器"
arch=('x86_64')
url="https://github.com/Colzry/m3u8Downloader"
license=('GPL-3.0')

# Tauri 运行在 Linux 上必须的核心依赖
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'cairo'
    'pango'
    'glib2'
    'openssl'
    'libayatana-appindicator'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

source=("${_pkgname}-${pkgver}.deb::https://github.com/Colzry/m3u8Downloader/releases/download/v${pkgver}/m3u8Downloader_${pkgver}_amd64.deb")

sha256sums=('SKIP')

package() {
    msg2 "Extracting deb package..."
    bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}/"
}
