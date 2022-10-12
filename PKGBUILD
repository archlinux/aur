# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.3.0
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

sha256sums_x86_64=("f2ccd3b32e6fd54cdaabc9c2c6b9d7fd2990870806b236272c4c08905aa690a4")
sha256sums_arm=("007d0658f74ce530bb48243b0b61c00580e4687221bc7037712ea1d54c2a9faf")
sha256sums_aarch64=("a1df3c807feda8ffede9b8540b7c64a6a9b950ed84617e7c1fdf601d2c4eecb2")
sha256sums_armv6h=("7164e3c33f57cc2a541c898b2dd9e42a9699467e644e11ec7876fb88129d480d")
sha256sums_armv7h=("2ce5747e6ae4ee8b2bf19146b42b228ef7c4d91d1db3f0d5cb0fc256c09c7f04")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
