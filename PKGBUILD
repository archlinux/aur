# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.2.8
pkgrel=2
pkgdesc="A TUI based Invidious client"
arch=('x86_64' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/darkhz/invidtui"
license=('MIT')
depends=('mpv' 'yt-dlp' 'ffmpeg')
optdepends=('mpv-mpris: for MPRIS support'
            'youtube-dl: yt-dlp alternative'
	    'screen: Efficiently resume and suspend instances')
provides=('invidtui')
conflics=('invidtui')

source_x86_64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_arm=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv5.tar.gz")
source_aarch64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz")

sha256sums_x86_64=("c7c8ed9f668597bd5c1dfedf64956dd41f08d13655ee157e87fd88ea6c042dcb")
sha256sums_arm=("c346aac0f1894c13d5b8a632d6513bf2704324a0e56d1a748b093fe077287719")
sha256sums_aarch64=("710c1d3847fe342f7a6fdb8b5b9dfc3dd7d5b322fa1fd9332ba38d4fd68e4159")
sha256sums_armv6h=("72e40daf1b9af15288be35eac783f7629a882804904337428ed9c605f338fd28")
sha256sums_armv7h=("b06825d2ae8dc0dffcd1ee25539c762b3fbb4506c2f72fc82bb810379fcdaf1f")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
