# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.2.9
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

sha256sums_x86_64=("5cbcfb071942ff21ae4dd5eae2531861de07ff9a493b1412b9ef6d28e2d4ae27")
sha256sums_arm=("116a244f879f01a235cbb33eaa5eb0e87573f2f6c045e3987f177546461a7e60")
sha256sums_aarch64=("f9503d5afd4fa4878f7a4dae4728f1b70768ac03ce664cebbc23644f5cc5f7e5")
sha256sums_armv6h=("26b2d7fc0f5624e131c78aa76d6b765842cdf8d4c43cbc7962ff17b42cb87b05")
sha256sums_armv7h=("e45bc96c6be45ef64f23cf2ff17ee15176a5303251082d0d4a05b5430fc47465")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
