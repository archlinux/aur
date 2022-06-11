# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.2.0
pkgrel=2
pkgdesc="A TUI based Invidious client"
arch=('x86_64' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/darkhz/invidtui"
license=('MIT')
depends=('mpv' 'yt-dlp' 'ffmpeg')
optdepends=('mpv-mpris: for MPRIS support'
            'youtube-dl: alternative for yt-dlp'
	    'screen: Efficiently resume and suspend instances')
provides=('invidtui')
conflics=('invidtui')

source_x86_64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_arm=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv5.tar.gz")
source_aarch64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz")

sha256sums_x86_64=("48da43b1ed25953d22485861efd530214bb0c5394280ed4b11f9b952ed3bebe4")
sha256sums_arm=("7d420b7fba42799a18f3fc2e680db0c77f6b5151b7bb14205ca2f95ac613e6dd")
sha256sums_aarch64=("d3e49ab1f249b2a1f32085d37f225c4944103e51c8187643375a2f83094f9160")
sha256sums_armv6h=("943c7ee0db3e347017b0fe443e57a97c2aa8f74c6b8d78cff4bd7871994ab573")
sha256sums_armv7h=("0188b65e8b74e559a7aa241be10d6757a5f69c9350f7fbe2b4fa418d7d08d999")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
