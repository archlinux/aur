# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.2.6
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

sha256sums_x86_64=("8b04c15e77e2265ad2ddc80a58816be242419e143bb8bac8710f19fd1092713d")
sha256sums_arm=("77e9102dcab15ce99ceefa143dac2c01abaf702f0667695b3f0b1972a1e7a8d6")
sha256sums_aarch64=("3535872f4e99cb3d5d660eaa689a808be498263327b919b9d8ae25599818cb03")
sha256sums_armv6h=("298393a96b313e3a690990f97f3df3ba946e7df254fc0753038677fa3cc10623")
sha256sums_armv7h=("520e4a04a2ac0dabc9b3ba25f7f988c84e5be456d232666ab8ae70b7b105658c")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
