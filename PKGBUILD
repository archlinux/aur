# Maintainer: Robert Manner <the_manni at users.sf.net>

pkgname=pytranscriber-bin
pkgver=1.8
pkgrel=1
pkgdesc="UI for generating transcription (subtitles) using Google Speech Recognition (X11)"
arch=('x86_64')
url="https://github.com/raryelcostasouza/pyTranscriber"
license=('GPL')
options=(!strip !zipman)
groups=()
depends=(libgl)
optdepends=()
source=("${url}/releases/download/v${pkgver}-stable/pyTranscriber-v${pkgver}-linux-portable.zip")
sha256sums=('a360e64ac95d8f99750d3b18d5afdeb6f9ad0c141d2be022c56597735152cd9d')

package()
{
  install -m 755 -D -T pyTranscriber-v${pkgver}-linux-portable/pyTranscriber-v${pkgver} "${pkgdir}/usr/bin/pyTranscriber"
}
