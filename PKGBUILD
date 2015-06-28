# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=whatmp3
pkgver=3.6
pkgrel=1
pkgdesc="A small Python script that accepts a list of directories containing FLAC files as arguments and converts them to MP3 with the specified options. It can optionally create a torrent file."
url="http://logik.li/projects/whatmp3/"
arch=('any')
license=('MIT')
depends=('python' 'mktorrent' 'flac')
optdepends=('vorbis-tools: OGG Vorbis support'
            'lame: MP3 support'
            'neroaacenc: AAC support'
            'neroaactag: AAC support'
            'mp3gain: ReplayGain support'
            'vorbisgain: ReplayGain support'
            'aacgain: ReplayGain support'
            'sox: dither support')
source=("https://github.com/RecursiveForest/whatmp3/archive/v${pkgver}.tar.gz")
sha256sums=('a1f5ef28e2511aa47f4658f71a8a3afe3dda96e7dd6a1cf9d124daead0fed5fa')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -D whatmp3 ${pkgdir}/usr/bin/whatmp3
}
