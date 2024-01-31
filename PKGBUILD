# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.4.1
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

sha256sums_aarch64=("2471e589049cfa1fcfd07342c0278c739433df89c60c2299a47056f25cbc2f18")
sha256sums_arm=("3dc58122d1ee6542f2a76ff59e5268b95c125fa1b336e3b09aadf6e7f236ccdd")
sha256sums_armv6h=("7f63ff8db9512c9bc636d5c20b4c31fd703b2121dbb8cd82b12aaaa92836af99")
sha256sums_armv7h=("8527f6fc195b2f4a6502b70de205ecffa541fd97b58a207aa7d80a30fe2f12ad")
sha256sums_i686=("b1b1d059d45e11c7c9efb815e185abddf1f82b9f36465cf0dace5046df970d6f")
sha256sums_x86_64=("7b76c8b778f037a3d5c00f0eb8a3c94918cf4fbe1a765006a4ea5ef425aa0239")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
