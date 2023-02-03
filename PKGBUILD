# Maintainer: JohnyRi <honza dot rindt at gmail dot com>
# Contributor: Hugo Osvaldo Barrera <hugo at osvaldobarrera dot com dot ar>

pkgname=hybrid-encoder
pkgver=20230122
pkgrel=1
pkgdesc="A very complete gui for video encoding"
arch=('x86_64')
options=(!strip)
license=('custom')
depends=('framecounter' 'freetype2' 'glib2' 'openssl' 'qt5-multimedia')
optdepends=('aften: support for AC-3 audio encoding'
'bdsup2subpp-git: support for subtitle converison for image based stream formats'
'dcaenc: support for DTS audio encoding'
'delaycut: AC-3, DTS, MPA and WAV audio delay and cutting support' 
'divx265: support for H.265 video encoding'  
'fdkaac: support for AAC audio encoding'
'flac: support for lossless FLAC audio encoding'
'gpac: support for MP4 container muxing'
'kvazaar: support for H.265 video encoding'
'libvpx: support fot VP8 video encoding'
'lsdvd: support for listing the content of DVD disks'
'mediainfo: support for technical and tag information about a video or audio file'
'mencoder: support for video and audio encoding'
'mkvtoolnix-cli: support for MKV container muxing'
'mp4fpsmod: support for MP4 time code modification'
'mplayer: support for video preview'
'neroaacenc: support for NERO AAC audio encoding'
'opus-tools: support for Opus audio encoding'
'sox: support for processing of audio files'
'tsmuxer: support for TS container'
'vapoursynth: A video processing framework with the future in mind'
'x264: support for H.264 video encoding'
'x265: support for H.265 video encoding')
url="http://www.selur.de/"

source_x86_64=(http://www.selur.de/sites/default/files/hybrid_downloads/Hybrid_${pkgver}_64bit_binary_qt515.zip
          hybrid.desktop
          Hybrid.png
          LICENSE)

package() {
  cd "${srcdir}"
  install -D -m755 Hybrid "${pkgdir}"/usr/bin/Hybrid
  install -D -m644 hybrid.desktop "${pkgdir}"/usr/share/applications/hybrid.desktop
  install -D -m644 Hybrid.png "${pkgdir}"/usr/share/pixmaps/Hybrid.png
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
sha256sums_x86_64=('24c62543e8da5dd9e7cb8982d1d4bf784b58b8fdda60bec8deb0d3655a5ace6e'
                   '5052a2a78a1d3dc5a2b20b352e9aa01bbc2d9afd0da28de604e970acc216384c'
                   '4b62792db9e95bb0e4c0969e72001b146b55e5e6af91df81c404d6ef61dd633f'
                   '9b56b57bb0cec33e3964c953f6340004476aad346d9a50dc93b8389ab083c015')
