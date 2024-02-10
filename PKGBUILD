# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.4.2
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

sha256sums_aarch64=("5873d279dc3cd53993b65acb752824da19014d824839689e26cd4e1055bcef5a")
sha256sums_arm=("a7e5b294faf4331223dad27359cd636deb6f19147a74a4507b1a8c5d4421acd1")
sha256sums_armv6h=("42a112ddc82b6d35fe63011aa99b21344eb0cbf029c25830ff4c89cb2e724ed7")
sha256sums_armv7h=("c090b002b7ed1c6f203037a0f62440fd2104cd083d708699a60b169f7bfd2ea2")
sha256sums_i686=("f54dfa361fa536bf8295ce6d221e5eba9ff9125619af8644c9d0841316e8370d")
sha256sums_x86_64=("6b24954919398c84bf79eb1c6a7ac5db1c4875889ec165f46623d128e7c67db1")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
