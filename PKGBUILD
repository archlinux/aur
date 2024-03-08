# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.4.3
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

sha256sums_aarch64=("b9263b8c9bc1c90c880cc89eb692e4f39d93fd45dcac98133e218c3544ae0da5")
sha256sums_arm=("0e85e4bc126a5cee7e44625e74aa55799e7370389c705193d620db43104fadaa")
sha256sums_armv6h=("95711ba90891050a7e5e22fa5d5a3494fc815153f0aa56300d327d0ddfb005e1")
sha256sums_armv7h=("1f96ee4ca5082e12388064fbf1222e5330e4e3f3e1f62c04610dc898938630f5")
sha256sums_i686=("580fc1488ab2b857f8a7bd2be8165eb18bfa2f7f470889fbc916c410de206138")
sha256sums_x86_64=("1b8a169b687b6803dbf3042205c04583e2469aafba4c60fe72e6744513c81955")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
