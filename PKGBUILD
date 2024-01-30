# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.3.9
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

sha256sums_aarch64=("0281dd5ed6f6159afc868732081d01745321937e37a6f738d6ec0ab1a89e2d1b")
sha256sums_arm=("84607c2a8ead5b42f39e52623e6cda9d74870111d228eec4511ec6354842c6ea")
sha256sums_armv6h=("8afad625b213999771def01340302a9c575f5281558d3222c6af3de1a9d52c81")
sha256sums_armv7h=("43978d1db66e2640fdab903907608fc6f455a80f62700f2afc481c967cb994b2")
sha256sums_i686=("783c35ccdfeecdfc7763001fef9e779d951b899484cc3e3ddc2066f0644b2c66")
sha256sums_x86_64=("e7bed0e6f99b247703dfbd7400f980cee1c5de6437ca6b1fa4ccd641b1502dba")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
