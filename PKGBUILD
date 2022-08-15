# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.2.3
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

sha256sums_x86_64=("8658e623745d204e7b67062fb5c546fd2af038b7495676827071e55bccf260a4")
sha256sums_arm=("d61b206207482c8afaba98680fcfc63a95760c0ba17e30cf7dda908fc2cb79e5")
sha256sums_aarch64=("773f87a2b95e09bf583da7147a5d80efbe663cd9a2c88f003b3a450a96033071")
sha256sums_armv6h=("15cbfc9984aff53c385d08d9e10331b3ec30349bf7ac86e67786c542343d15c3")
sha256sums_armv7h=("91d497d6a9f7ee43940f7cfc4896927d92f79a4b2d64d17cb2deba3ab590bbde")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
