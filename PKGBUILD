# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.3.6
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

sha256sums_arm=("5ca0cf13f27b0c4c866001c979fbd509c714a87ca482706ff3e9342e0dd0a5ac")
sha256sums_i686=("864b4b67571f48ac768ada6243c31496fa93f12ab1a5edd9efef92eeec571ea5")
sha256sums_armv6h=("b5ffee72050f3a47a381209dc923755c200e9b0e398e8f4f5faf499a5caf45a3")
sha256sums_aarch64=("d03fca4a85ed9092e806115d058f0b7ed9703672c828032877da5595da95335f")
sha256sums_x86_64=("d11231761ca7b84fbee930fa79f9101c3e070f22c2d4addedb56faf724501312")
sha256sums_armv7h=("f60b48d57beb706ad1be25af52baeae08cce14ee327c326ccda264eb33cc8695")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
