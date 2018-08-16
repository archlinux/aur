# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=spotify-ripper
pkgver=2.11
pkgrel=3
pkgdesc='Command-line ripper for Spotify, with a workaround for playlist emptying'
arch=('any')
url="https://github.com/colorizedmind/spotify-ripper"
license=('MIT')
depends=('python2' 'python2-spotify' 'mutagen' 'python2-colorama' 'python2-requests' 
         'python2-schedule' 'python2-spotipy' 'lame')
optdepends=('flac: Rip songs to lossless FLAC encoding' 'opus-tools: Rip songs to Opus encoding' 
            'vorbis-tools: Rip songs to Ogg Vorbis encoding' 'faac: Rip songs to AAC format with FreeAAC' 
            'libav-git-no-libs: Rip songs to Apple Lossless format' 'fdkaac: Rip songs to MP4/M4A format with Fraunhofer FDK AAC codec')
makedepends=('python2-setuptools')
source=("https://github.com/colorizedmind/spotify-ripper/archive/a044a2ee8ce9d42f43ec973a2480ec5f62598ae7.zip")
md5sums=('0365af83b46ad43c6331cb7887ed06f8')

package() {
    cd $pkgname-*
    python2 setup.py install --root="$pkgdir"
}
