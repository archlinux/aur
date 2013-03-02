# Contributor: mutantmonkey <mutantmonkey@gmail.com>
pkgname=whatmp3
pkgver=3.5.1
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
md5sums=('f3a71fe0b0d85df681f868e7ede871de')
sha256sums=('0dd9018e845c25fc7155394c2f08d3163f5f009db50d108364258d2cecdd1bad')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -D whatmp3 ${pkgdir}/usr/bin/whatmp3
}
