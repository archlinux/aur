# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.4.5
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

sha256sums_aarch64=("f84665ebc1ee2041e3b5647321e0ab7887cb38548bdcc9cbcaa96eaa6ce5a9f8")
sha256sums_arm=("6949c9778e9652d1830d2204931314156a262e82e8fbdf5208772388c34b205f")
sha256sums_armv6h=("9174fb6690e8ad8a12b514cfddaf0a17b318efce72e5ef0218edec0e6a8479a3")
sha256sums_armv7h=("1b075009091addcd2e4ab7a6151ce6d75965a46370da09896af07c39e60ab82a")
sha256sums_i686=("53669e1716e594b2dbd51336f553da0345ca2b03bafbc29512416960d6a83cc8")
sha256sums_x86_64=("69adbbe517daca6d75d33a7254975a689ae627dd0f8207554bf297681fe96b8e")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
