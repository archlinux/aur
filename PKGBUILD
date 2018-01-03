# Maintainer: Radostin Stoyanov <rstoyanov1 at gmail dot com>
pkgname=youtube-dl-mp3
pkgver=2018.01.03
_appname=youtube-dl-mp3
_release=2018.01.03
pkgrel=1
pkgdesc="Convert YouTube videos in HQ audio with mp3 format."
arch=('any')
url="https://github.com/rst0git/youtube-dl-mp3"
license=('custom')
depends=('youtube-dl')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files')
source=(${pkgname})
md5sums=('d602848d18fdb089736644f16c26ecea')

package() {
	install -Dm755 youtube-dl-mp3 "${pkgdir}/usr/bin/youtube-dl-mp3"
}
