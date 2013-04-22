# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=whatmp3
pkgver=3.5.3
pkgrel=1
pkgdesc="A small Python script that accepts a list of directories containing FLAC files as arguments and converts them to MP3 with the specified options. It can optionally create a torrent file."
url="http://logik.li/projects/whatmp3/"
arch=('any')
license=('MIT')
depends=('python' 'mktorrent' 'flac' 'lame')
optdepends=('vorbis-tools: OGG Vorbis support'
            'neroaacenc: AAC support'
            'neroaactag: AAC support')
source=("http://logik.li/projects/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2856215a99eefb8cb1eccbbaa0e7b06e8c97509b499d13cbd5392598bd2384ae')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -D whatmp3 ${pkgdir}/usr/bin/whatmp3
}
