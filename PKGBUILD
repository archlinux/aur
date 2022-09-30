# Maintainer: Robert Manner <the_manni at users.sf.net>

pkgname=pytranscriber-wl-bin
pkgver=1.8
pkgrel=1
pkgdesc="UI for generating transcription (subtitles) using Google Speech Recognition (Wayland)"
arch=('x86_64')
url="https://github.com/raryelcostasouza/pyTranscriber"
license=('GPL')
options=(!strip !zipman)
groups=()
depends=(libgl) # TODO
optdepends=()  # TODO
source=("${url}/releases/download/v${pkgver}-stable/pyTranscriber-v${pkgver}-linux-gnome40-wayland-portable.zip")
sha256sums=('a23835c09c496f564adcc8076d068f197e283ef8a16fec0e29f23586c75119b4')

package()
{
  install -m 755 -D -T pyTranscriber-v${pkgver}-linux-gnome40-wayland-portable/pyTranscriber-v${pkgver}-gnome40-wayland "${pkgdir}/usr/bin/pyTranscriber"
}
