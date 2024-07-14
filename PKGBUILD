# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.4.6
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

sha256sums_aarch64=("094a6482305a3fb00935b7ba173db2d1c023e063f45555e13094ed22887d63e5")
sha256sums_arm=("3a71a068f56b2e03468628e8b69fd95e47fe8573927e27ff5289c411ba2f95c8")
sha256sums_armv6h=("76af8e5c1a0ce0ef9fb3ce9ccf0271bbc770bb236e1a6637b9a611d61f0fa5c4")
sha256sums_armv7h=("5afc9bf492cbcf6a988d5445453cef8eac3d08cf1443e9a4f63ea9af3edef6ba")
sha256sums_i686=("26cd9c8e56825739c5b5e15a5614879da85d2eda4082768c6581ea113eaa3dff")
sha256sums_x86_64=("ab201aa30669ba8131c693abf39bf10bae6bf69e0b0ccbdd60bf772ba6d68429")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
