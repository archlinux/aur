# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

_pkgname="open-video-downloader"
_srcname="youtube-dl-gui"
_srcmntr="jely2002"

pkgname="${_pkgname}"
pkgver="3.2.0"
pkgrel="1"
pkgdesc="A cross-platform GUI for youtube-dl made in Rust with Tauri and Vue + Typescript"
url="https://github.com/${_srcmntr}/${_srcname}"
arch=("x86_64")
license=("AGPL3")
options=("!strip" "!debug")
depends=("gtk3" "webkit2gtk-4.1")
_archive="${_pkgname}-${pkgver}.deb"
source=("${_archive}::https://github.com/${_srcmntr}/${_srcname}/releases/download/app-v${pkgver}/Open.Video.Downloader_${pkgver}_amd64.deb")
conflicts=("open-video-downloader")
provides=("open-video-downloader")

sha256sums=("2a0190508c5b80d2801765073385439bf6dac7749473c19f842fbd5067f18e15")

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
