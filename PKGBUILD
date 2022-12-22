# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.3.1
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

sha256sums_x86_64=("76c63930cae969c3da0af58a95405fc46c19467961124572658d22b7ff22b084")
sha256sums_arm=("9a9dd5547192de2175cb50f784ab9521eda64bf8a6451a979480b6b047fbd24e")
sha256sums_aarch64=("f306a45834d736bc0769aaae3db9675cb454551cc0824fe806830e67f6a3af7a")
sha256sums_armv6h=("7e94a8d12b2b2c30b39af0aaeb093cd3b1ef555e73595410eb644bcb9b61a28b")
sha256sums_armv7h=("e1e936c2d114f0a99926bf9c366f5ec0498456096daa13c8e1d0a117c5b415e3")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
