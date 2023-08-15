# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.3.4
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
conflics=('invidtui')

source_x86_64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_arm=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv5.tar.gz")
source_aarch64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz")

sha256sums_x86_64=("af00eb17821b86dbde5914dafad6d5a2f0aa43690ccfe5113e01ac464e8840fd")
sha256sums_arm=("aa70fc767fd558f0fc218a2e9d710fd5797d0c13a39be2612ac1f19577b15ce3")
sha256sums_aarch64=("5f6b88cfbf4d20f45ab13f297f142ca8db2507003c5461d7ef574fc53bd29c70")
sha256sums_armv6h=("3d0c10c5b7ca21c2d9dee6e0497c1ca0db85c5c0873d82e0be34d12c910034e1")
sha256sums_armv7h=("e2e8c3a78c9befc76996d5b33c82f352481b6d859753e7ad2df7dc1f78100d63")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
