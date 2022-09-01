# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.2.5
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

sha256sums_x86_64=("cecb34c089ddb6e8484b6de9555e19ca627d664a926e99ec8b2f7ee7e51f018f")
sha256sums_arm=("0be7f162581f3b02fab9963a99cb77055c1430463951a206e68d81496e6a84e0")
sha256sums_aarch64=("d3fef61419cebf5f67565051880d1ee077845f42b20788e2b346647a2e132549")
sha256sums_armv6h=("2607a15a52b5d0e7dd60608e399327a4519450ccb8255eeb20dfb1281a41fe55")
sha256sums_armv7h=("4edab64c4f545390a622caf58fa9d5095a2c279abedcb8286454934f6430a491")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
