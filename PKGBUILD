# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.3.7
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

sha256sums_aarch64=("661db6d3af9da2372aebb2aa888835ef75c7b5c3030b898a5f3ff81fd34336c7")
sha256sums_arm=("8e4172dbe3fd1e3e0c682997d6d9aefa39eebe5fe1b86af9b31d729f425527bb")
sha256sums_armv6h=("7ae602ba4e29861eb00cafedc82606b79091a053c705dbdc8f8de217e41f6d92")
sha256sums_armv7h=("090f56f978f4fb2e36e3e2253ec4cf617019b1bae6b56107293b4cb0a3e74084")
sha256sums_i686=("88f929da73f55f30c2d3f9a18c565bee02d25e59a69314bd04d5a15d3ce93fe2")
sha256sums_x86_64=("b3b90d05878bb90f3caacde48d8bc38d02a17b4c4e283167063c69007bf6ad4d")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
