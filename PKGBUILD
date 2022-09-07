# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.2.7
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

sha256sums_x86_64=("c8475c4a9167082480313ff5eb83e36a7542dcaa840362adab0bad393be871c5")
sha256sums_arm=("0d342ffa66a21919e98b184228a9e53f6fe783aef3786db534550c4ddce78e94")
sha256sums_aarch64=("c6c4a5bdff08e950684cf6fb3eab1390f7b3f305bc0b820829bba74f11050fad")
sha256sums_armv6h=("785e0f711d17c8809a7e89d8e1508fd8d45bd20ba06879daf58cce6868d7bd50")
sha256sums_armv7h=("883cb007a9b2a8abba2d0ff36d914b24ab7ffa375359a8a04b269f7a9a880534")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
