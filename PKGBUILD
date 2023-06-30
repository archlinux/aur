# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.3.2
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

sha256sums_x86_64=("af2cf22f3f81287a3cc842d4f74a4d79f74429d65b5d9b9519476020bb88983f")
sha256sums_arm=("0e629da41eac56a33786333cd251211dde977df130727302beffc232a3bdadd6")
sha256sums_aarch64=("9d0b3c0d1b6e0ea5b74691b4303da08b9d7298bfb77057ecfa7a7caacfc4084e")
sha256sums_armv6h=("58aebb58c6611648424f40f751be8ce8a0a12986e5c2447305a071ac2e908a1f")
sha256sums_armv7h=("dd0dda9401965cf3ef2f502d52bcb13718e1f9e291d471525e1b7001f7e1d95a")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
