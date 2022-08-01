# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.2.2
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

sha256sums_x86_64=("0b26bad4fda2fb7dd9a73815fe0c97bc99cf973b8ca19292c8b985a731f447cb")
sha256sums_arm=("f295128e99d34f7fe428f32cd1933e369d8a317cb721cae74a8dd2a1441aff19")
sha256sums_aarch64=("46e809d4b77a0c4f930e2f4b0e7a9357336083f25559b720944afd01efadb711")
sha256sums_armv6h=("712776dfaea3c5c24cfddcd2800b5b9eaa02e85e1c55a8834f4b375c42cf58aa")
sha256sums_armv7h=("b79f692c580664b559b9ff06ee3cad37501e88288309fa8d5d2028384f85fe66")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
