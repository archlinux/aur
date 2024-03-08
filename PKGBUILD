# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.4.4
pkgrel=1
pkgdesc="A TUI based Invidious client"
arch=('x86_64' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/darkhz/invidtui"
license=('MIT')
depends=('mpv' 'yt-dlp' 'ffmpeg')
optdepends=('mpv-mpris: for MPRIS support'
            'youtube-dl: yt-dlp alternative'
	    'screen: Efficiently resume and suspend instances')
provides=('invidtui')
conflicts=('invidtui')

source_x86_64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_arm=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv5.tar.gz")
source_aarch64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz")

sha256sums_aarch64=("0209ec888c61dea4d8b4e75ac445e1a102529a57a4df21aa34f1b2b57ec938f6")
sha256sums_arm=("8ac8c24beec61afbd5b3994bc33b3336b7854d8e371a74d5f14eae5bf47df85a")
sha256sums_armv6h=("161693c20b0625c6eb9acd9b485e3196bd8370cfc22b365668ed8472379447a7")
sha256sums_armv7h=("f633a809cb8b0a8f131e5842b7cae4d447cbfdb9125a45d469e13549f41c32f3")
sha256sums_i686=("bf291a7eac30cb59b2bd2bc20bd28aa03f078eaf0c65726a8c57c219fc8be2c1")
sha256sums_x86_64=("749358cb2322e548a57de15444521ae10f40f67979c4b870499b95d0bc99c0d8")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
