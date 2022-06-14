# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.2.1
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

sha256sums_x86_64=("b3e922cce9bc410fc9c1db0376672de5b59ce29455f97282e28379ff64ad6db8")
sha256sums_arm=("b1769dff871a11184413be9e8a12af40c342215e74876bbbbf554cbbd239e684")
sha256sums_aarch64=("0fec277c99e62f35336edcebf9b381c6ca42b21ee61d5858ba0c491938b5dda8")
sha256sums_armv6h=("12817bf9cfeb51a2b46b9a01c9fff02b8cb116eb1d7d0f2525a8126d7b1aaba8")
sha256sums_armv7h=("58c0465af6b0d7d04d434287d1afddfb192c5b1cb6f36bf99f556776f2ccefe7")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
