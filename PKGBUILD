# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.3.5
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

sha256sums_x86_64=("f40334166eca7ba382d97c276d4cf1e2f6915099de1f4c8619de82dfd5c5a174")
sha256sums_arm=("ba542db17961408210d176e497d659bc27b4fbb7ec2a89c1320ffa9eaf879713")
sha256sums_aarch64=("c469311a4c0072f0bce0bcae36d4d22eb99b47c98c4e56db7bf177a438257d3b")
sha256sums_armv7h=("7a5db663c8af9acb1e24925c5b96359ec658cdb842cf4821b39db97810cf5653")
sha256sums_armv6h=("7fb98d5d9d3b0aef9824094852facde635defbfb8983b7193f333d4c59aaaaff")
sha256sums_i686=("d2ef4802fc6b232f4f5dacdc9de37fbd94bbbd7cd6c96e206dd754bf9ad49548")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
