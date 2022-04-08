# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.1.9
pkgrel=2
pkgdesc="A TUI based Invidious client"
arch=('x86_64' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/darkhz/invidtui"
license=('MIT')
depends=('mpv' 'yt-dlp' 'ffmpeg')
optdepends=('mpv-mpris: for MPRIS support'
            'youtube-dl: alternative for yt-dlp')
provides=('invidtui')
conflics=('invidtui')

source_x86_64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_arm=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv5.tar.gz")
source_aarch64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz")

sha256sums_x86_64=("790b85baac641dbb4037c4a5dc7d3515c1fa5f350d9bc3f069724b54ad81e91c")
sha256sums_arm=("291c8b184beaabb7ceed7a2b58fa9f350afec1f6f7feeb4ab2fb51f7fbdd655e")
sha256sums_aarch64=("42ea942f608bfc087aab91bb64778e6b2602e3549fe5ec79539bf73cf6388cfe")
sha256sums_armv6h=("1f1fa775f36a9e8c33968c193713bfae97e3521c37942c9da59dd1bb130bcaf0")
sha256sums_armv7h=("f83fca8c10173a20d979e18c81467eafc81adcc803c597a06b4270ab5aafa63f")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
