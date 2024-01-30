# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.3.8
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

sha256sums_aarch64=("48c834ba15a14d7eb05a49ad084bb0eefc10565066dcd24615662804e2934040")
sha256sums_arm=("18e5d6b991dc78005d7ecad9528201664f7a4be484cb943d822f1efcd4896769")
sha256sums_armv6h=("f6a9757ed68a9c8b446103346883863b7bf7f324027a2f8981e2c964ad45835b")
sha256sums_armv7h=("15ce0c419b40a51cbbfac6e7453e7808acf971f9767c55de8be8b4398eb7bedf")
sha256sums_i686=("c81b754bcdf202032518af3233a3475a3c9d5040990e0feda80e62f6122b885f")
sha256sums_x86_64=("64e55769535ef39be521ca29f50db36638482b0d48a9934109d7ddcfbfc6e97e")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
