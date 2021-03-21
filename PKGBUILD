# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Julius <com dot gmail at julius dot dehner>
# Contributor: vixfwis <com dot gmail at vixfwis>

_pkgname=youtube-dlp
pkgname=${_pkgname}-bin
_gitname=yt-dlp
pkgver=2021.03.15
_gitpkgver="2021.03.15"
pkgrel=1
pkgdesc="Fork of youtube-dlc - download videos from youtube.com or other video platforms"
arch=('any')
url="https://github.com/yt-dlp/${_gitname}"
license=('Unlicense')
depends=('python')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'aria2: for using aria2 as external downloader'
            'python-pycryptodome: for hlsnative downloader')
source=("yt-dlp-${_gitpkgver}::${url}/releases/download/${_gitpkgver}/yt-dlp")
provides=('yt-dlp')
sha256sums=('9542d095c5abe44e2ec08091f7ff0fd905fd43b1864afa44ea4981080ff9bd01')

package() {
  install -Dm755 "yt-dlp-${_gitpkgver}" "${pkgdir}/usr/bin/yt-dlp"
}
